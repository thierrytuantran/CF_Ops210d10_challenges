#!/bin/bash

# Script Name:                  Hello World
# Author:                       Thierry Tran
# Date of latest revision:      10/30/2023
# Purpose:                      Ops210d10-challenges_06

# Declaration of variables

# Define an array of colors
colors=("red" "blue" "green" "yellow")

# For-Loop
for color in "${colors[@]}"; do
    # Define the directory path
    path="$HOME/my_colors_file/${color}"

    # Check if the directory exists
    if [ -d "$path" ]; then
        echo "Directory already existed: $path"
    else
        mkdir -p "$path"  # Create the directory if they don't exist
        echo "Created directory: $path"
    fi
done



# Main

# End