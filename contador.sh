#!/bin/bash

CONTADOR=1
while [  $CONTADOR -lt 11 ]; do
      say "$CONTADOR";
      let CONTADOR++;
done
