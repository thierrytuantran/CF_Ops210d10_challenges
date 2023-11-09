#!/bin/bash

# Function to gather information and save to a text file
gather_info() {
    local domain="$1"
    local output_file="domain_info.txt"

    # Run whois, dig, host, and nslookup, and append the results to the output file
    whois "$domain" >> "$output_file"
    dig "$domain" >> "$output_file"
    host "$domain" >> "$output_file"
    nslookup "$domain" >> "$output_file"

    echo "Information collected and saved in $output_file"
    xdg-open "$output_file"  # Opens the text file with the default text editor
}

# Prompt the user to enter a domain
read -p "Enter a domain: " domain

# Ensure the 'whois' command is available
if ! command -v whois &> /dev/null; then
    echo "Error: 'whois' command is not installed. Please install it."
    exit 1
fi

# Call the function to gather and save information
gather_info "$domain"
