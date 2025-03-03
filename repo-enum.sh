#!/bin/bash

# Wordlist of directories/files (common names)
wordlist_nomes=("admin" "backup" "test" "logs" "config" "data" "passwords")

# Wordlist of file extensions (common extensions)
wordlist_extensoes=(".txt" ".log" ".bak" ".json" ".php")

# Menu function to display options to the user
menu_escolhas()
{
    echo -e "\nOptions:
    [1] Standard Search (List everything)
    [2] Use external wordlist
    [3] Search by name
    [4] Search by extension
    [5] Search for files only"
    
    # Prompt for user input to choose an option
    echo -n "Choose your option: "
    read escolha

    # Execute the corresponding function based on user choice
    case $escolha in
        1) busca_padrao ;;  # Option 1: List everything in the specified directory
        2) usar_wordlist ;;  # Option 2: Use an external wordlist for searching
        3) busca_nome ;;  # Option 3: Search for files/directories by name
        4) busca_extensao ;;  # Option 4: Search for files by extension
        5) busca_apenas_arquivos ;;  # Option 5: List only files (ignoring directories)
        *) echo "Invalid option." ;;  # If an invalid option is chosen
    esac
}

# Standard search: List everything in the specified directory
busca_padrao() {
    echo -n "Enter the directory to search: "
    read diretorio

    # Check if the specified directory exists
    if [ ! -d "$diretorio" ]; then
        echo "Error: The directory does not exist."
        return
    fi

    # List all files and directories in the specified directory
    echo "Listing everything in $diretorio..."
    find "$diretorio"
}

# Use an external wordlist to search for specific files or directories
usar_wordlist() {
    echo -n "Enter the path to the wordlist: "
    read wordlist

    # Check if the wordlist file exists
    if [ ! -f "$wordlist" ]; then
        echo "Error: Wordlist file not found."
        return
    fi

    # Prompt for the directory to search in
    echo -n "Enter the directory to search: "
    read diretorio

    # Search each entry in the wordlist within the specified directory
    echo "Searching for entries from the wordlist in $diretorio..."
    while read -r palavra; do
        caminho="$diretorio/$palavra"
        # If the entry exists, print the found path
        if [ -e "$caminho" ]; then
            echo "Found: $caminho"
        fi
    done < "$wordlist"
}

# Search for files or directories by name
busca_nome() {
    echo -n "Enter the directory to search: "
    read diretorio

    echo -n "Enter the name to search for: "
    read nome

    # Search for files or directories matching the name pattern
    echo "Searching for '$nome' in $diretorio..."
    find "$diretorio" -type f -name "*$nome*"
}

# Search for files with a specific extension in a directory
busca_extensao() {
    echo -n "Enter the directory to search: "
    read diretorio

    echo -n "Enter the extension to search for (e.g., .txt): "
    read extensao

    # Search for files with the specified extension
    echo "Searching for files with extension $extensao in $diretorio..."
    find "$diretorio" -type f -name "*$extensao"
}

# List only files (ignoring directories) in the specified directory
busca_apenas_arquivos() {
    echo -n "Enter the directory to search: "
    read diretorio

    # List only files in the specified directory
    echo "Listing only files in $diretorio..."
    find "$diretorio" -type f
}

# Call the menu function to display options to the user
menu_escolhas
