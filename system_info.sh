#!/bin/bash

# Script Name:                  System_Infos
# Author:                       Thierry Tran
# Date of latest revision:      10/31/2023
# Purpose:                      Ops210d10-challenges_07

#!/bin/bash

# Get computer name
echo "Thierry_Computer:" 
hostname
echo

# Get CPU info
echo "CPU:"
lshw -class processor | grep -e "product:" -e "vendor:" -e "physical id:" -e "bus info:" -e "width:"
echo

# Get RAM info  
echo "RAM:"
lshw -class memory | grep -e "description:" -e "physical id:" -e "size:"
echo

# Get display adapter info
echo "Display Adapter:"
lshw -class display | grep -e "description:" -e "product:" -e "vendor:" -e "physical id:" -e "bus info:" -e "width:" -e "clock:" -e "capabilities:" -e "configuration:" -e "resources:"
echo

# Get network adapter info
echo "Network Adapter:"  
lshw -class network | grep -e "description:" -e "product:" -e "vendor:" -e "physical id:" -e "bus info:" -e "logical name:" -e "version:" -e "serial:" -e "size:" -e "capacity:" -e "width:" -e "clock:" -e "capabilities:" -e "configuration:" -e "resources:"