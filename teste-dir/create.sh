#!/bin/bash

mkdir test-dir && cd $_ && touch {1..10}.txt
cd test-dir && echo "Hello" > {1..10}.txt
ls -la 