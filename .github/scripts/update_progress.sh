#!/bin/bash

ROOT="beecrowd"

TOTAL=0
OUTPUT=""

EMOJIS=("🟢" "🟡" "🔵" "🟣" "🔴" "🟠" "⚪")

INDEX=0

for folder in "$ROOT"/*; do

    if [ -d "$folder" ]; then

        COUNT=$(find "$folder" -type f -name "*.c" | wc -l)

        NAME=$(basename "$folder")

        NAME=$(echo "$NAME" | sed 's/^[0-9-]*//')

        NAME=$(echo "$NAME" | sed 's/ em C//')

        EMOJI=${EMOJIS[$INDEX]}

        OUTPUT="$OUTPUT$EMOJI $NAME .......... $COUNT\n"

        TOTAL=$((TOTAL+COUNT))

        INDEX=$((INDEX+1))

    fi

done

TODAY=$(date +"%d %b %Y")

BLOCK=$(printf "## 📊 Progresso\n\n\`\`\`text\n🟢 Beecrowd\n\n${OUTPUT}\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n🏆 Total: ${TOTAL}\n🕒 Última Atualização: ${TODAY}\n\`\`\`")

awk '
/<!-- START_PROGRESS -->/{
print;
print block;
skip=1;
next
}
/<!-- END_PROGRESS -->/{
skip=0
}
!skip
' block="$BLOCK" README.md > README.tmp

mv README.tmp README.md