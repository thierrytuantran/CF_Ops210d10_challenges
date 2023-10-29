#!/bin/bash

# Script Name:                  Hello World
# Author:                       Thierry Tran
# Date of latest revision:      10/29/2023
# Purpose:                      Ops210d10-challenges_05

# Write a script
# Displays running processes
# Asks the user for a PID
# Kills the process with that PID
# Starts over at step 1 and continues until the user exits with Ctrl + C

#!/bin/bash

while true; do
    
    echo "Running Processes:"
    ps aux

    read -p "Enter the PID of the process" pid

    if ps -p $pid > /dev/null; then
        kill -9 $pid
        echo "Process with PID $pid killed."
    else
        echo "No process found with PID $pid."
    fi
done
