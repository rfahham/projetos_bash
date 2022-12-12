#!/bin/bash
glb_ixia=./glb_ixia.txt #arquivo que será gerado
glb_ids=./glb.txt # arquivo com os glbids
echo "$" > $glb_ixia
for i in $(cat $glb_ids); do
  echo "\X-GLB-Token: $i" >> $glb_ixia
  echo "\X-GLB-Usuario: $i" >> $glb_ixia
  echo "$" >> $glb_ixia
done