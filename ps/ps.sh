#!/bin/bash

processos=$(ps | head -n 11| grep [0-9])

processos2=$(ps -p 89498 -o comm=)
