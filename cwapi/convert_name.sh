#!/bin/bash

# touch screen_53535353.jpg


num=1

for i in *.jpg 
do
mv $i $num".jpg"

num=$((num+1))

done