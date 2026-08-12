#!/usr/bin/env bash
#
# Gera o bloco de progresso do README a partir das soluções em beecrowd/
# Substitui .github/scripts/update_progress.sh
#
set -euo pipefail

ROOT="beecrowd"
README="README.md"

# Extensões contadas. Para adicionar uma linguagem, acrescente aqui e em LABEL.
EXTENSOES=("c" "cpp" "py" "java")

declare -A LABEL=(
    ["c"]="C"
    ["cpp"]="C++"
    ["py"]="Python"
    ["java"]="Java"
)

EMOJIS=("🟢" "🟡" "🔵" "🟣" "🔴" "🟠" "⚪" "🟤" "🩵" "🩷")

# --- validações ---------------------------------------------------------

if [ ! -d "$ROOT" ]; then
    echo "::error::pasta '$ROOT' nao encontrada"
    exit 1
fi

if ! grep -q "START_PROGRESS" "$README" || ! grep -q "END_PROGRESS" "$README"; then
    echo "::error::marcadores START_PROGRESS / END_PROGRESS ausentes no $README"
    exit 1
fi

# --- monta a expressão do find (-name "*.c" -o -name "*.cpp" ...) -------

FIND_EXPR=()
for ext in "${EXTENSOES[@]}"; do
    FIND_EXPR+=(-o -name "*.${ext}")
done
FIND_EXPR=("${FIND_EXPR[@]:1}")   # remove o "-o" inicial

contar() {
    # $1 = diretório, $2 = extensão (opcional; vazio conta todas)
    local dir="$1" ext="${2:-}"
    if [ -n "$ext" ]; then
        find "$dir" -type f -name "*.${ext}" 2>/dev/null | wc -l
    else
        find "$dir" -type f \( "${FIND_EXPR[@]}" \) 2>/dev/null | wc -l
    fi
}

# --- conta por categoria ------------------------------------------------

TOTAL=0
INDEX=0
LINHAS=""
LARGURA=28   # coluna onde os pontinhos terminam

while IFS= read -r folder; do
    [ -d "$folder" ] || continue

    COUNT=$(contar "$folder")
    [ "$COUNT" -eq 0 ] && continue          # pula pastas vazias

    NAME=$(basename "$folder")
    NAME=$(sed -E 's/^[0-9]+[[:space:]]*-?[[:space:]]*//' <<< "$NAME")           # tira "1 - " / "1- " / "1"
    NAME=$(sed -E 's/[[:space:]]+em[[:space:]]+(C\+\+|C|Python|Java)$//i' <<< "$NAME")  # tira " em C"
    NAME=$(sed -E 's/^[[:space:]]+|[[:space:]]+$//g' <<< "$NAME")                # trim

    EMOJI=${EMOJIS[$((INDEX % ${#EMOJIS[@]}))]}                                  # nunca estoura o array

    PONTOS=$(printf '%*s' $((LARGURA - ${#NAME})) '' | tr ' ' '.')
    [ ${#NAME} -ge $LARGURA ] && PONTOS="..."

    LINHAS+="${EMOJI} ${NAME} ${PONTOS} ${COUNT}"$'\n'
    TOTAL=$((TOTAL + COUNT))
    INDEX=$((INDEX + 1))
done < <(find "$ROOT" -mindepth 1 -maxdepth 1 -type d | sort -V)

# --- conta por linguagem ------------------------------------------------

POR_LINGUAGEM=""
for ext in "${EXTENSOES[@]}"; do
    N=$(contar "$ROOT" "$ext")
    [ "$N" -eq 0 ] && continue
    POR_LINGUAGEM+="${LABEL[$ext]}: ${N}   "
done
POR_LINGUAGEM=$(sed -E 's/[[:space:]]+$//' <<< "$POR_LINGUAGEM")

# --- data em português (fuso de Brasília) -------------------------------

MESES=(jan fev mar abr mai jun jul ago set out nov dez)
export TZ="America/Sao_Paulo"
MES_NUM=$(date +%-m)
HOJE="$(date +%d) ${MESES[$((MES_NUM - 1))]} $(date +%Y)"

# --- monta o bloco ------------------------------------------------------

BLOCO=$(mktemp)
trap 'rm -f "$BLOCO" README.tmp' EXIT

{
    echo '## 📊 Progresso'
    echo
    echo '```text'
    echo '🟢 Beecrowd'
    echo
    printf '%s' "$LINHAS"
    echo
    echo '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'
    echo
    echo "🏆 Total: ${TOTAL}"
    [ -n "$POR_LINGUAGEM" ] && echo "💻 ${POR_LINGUAGEM}"
    echo "🕒 Última atualização: ${HOJE}"
    echo '```'
} > "$BLOCO"

# --- substitui entre os marcadores --------------------------------------

awk -v blockfile="$BLOCO" '
    /<!-- START_PROGRESS -->/ {
        print
        while ((getline line < blockfile) > 0) print line
        close(blockfile)
        skip = 1
        next
    }
    /<!-- END_PROGRESS -->/ { skip = 0 }
    !skip
' "$README" > README.tmp

mv README.tmp "$README"

echo "✅ progresso atualizado: ${TOTAL} soluções (${POR_LINGUAGEM})"
