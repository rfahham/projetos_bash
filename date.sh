#!/bin/bash

array=(@1642387142.25 @1642387147.25 @1642387152.254 @1642387157.25)

for i in ${array[@]} ; do date $1 ; done

echo ${array[0]}
