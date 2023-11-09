#!/bin/bash

# Function to gather domain information and save to a text file
gather_domain_info() {
    local domain="$1"
    local output_file="domain_info.txt"

    echo "Fetching domain information for: $domain"

    # Run whois, dig, host, and nslookup, and append the results to the output file
    whois "$domain" > "$output_file" 2>&1
    dig "$domain" >> "$output_file" 2>&1
    host "$domain" >> "$output_file" 2>&1
    nslookup "$domain" >> "$output_file" 2>&1

    echo "Domain information collected and saved in $output_file"
    xdg-open "$output_file"  # Opens the text file with the default text editor
}

# Check if whois is installed; if not, install it
if ! command -v whois &> /dev/null; then
    echo "The 'whois' command is not installed. Installing it now..."
    sudo apt-get update
    sudo apt-get install whois -y
    echo "Installation complete."
fi

# Prompt the user to enter a domain
read -p "Enter a domain: " domain

# Call the function to gather and save domain information
gather_domain_info "$domain"
