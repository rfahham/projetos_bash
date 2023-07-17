#!/bin/bash
user_json=./user.json 
glb_ids=./glbids.txt

echo "[" >> $user_json

while IFS= read -r linha || [[ -n "$linha" ]]; do
  user_id=`echo $linha | cut -d ";" -f 1`
  authorization=`echo $linha | cut -d ";" -f 2`

  echo "{"\"userId\": "\"`echo $user_id`\"," >> $user_json
  echo ""\"authorization\": "\"`echo $authorization`\"}," >> $user_json

done < "$glb_ids"
echo "]" >> $user_json