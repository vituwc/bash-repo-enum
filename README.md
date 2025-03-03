# Easy Bash Repository Enumerator

A simple Bash script for basic repository and directory enumeration. It offers several search options to find files and directories based on names, extensions, or external wordlists.

## Features

The script provides the following options:

1. **Standard Search**: Lists all files and directories in a specified directory.
2. **Use External Wordlist**: Search for files and directories using a custom wordlist.
3. **Search by Name**: Search for files or directories by name.
4. **Search by Extension**: Search for files with a specific extension.
5. **Search for Files Only**: Lists only files (ignoring directories).

## Prerequisites

- Unix-like system (Linux, macOS, etc.)
- Bash (version 4 or higher recommended)

## Usage

1. Clone the repository or download the `enum-repo.sh` script.
2. Grant execute permissions:
   ```bash
   chmod +x enum-repo.sh
   ```
3. Run the script:
   ```bash
   ./enum-repo.sh
   ```

4. Choose an option from the menu and follow the prompts.

## Example Usage

### Standard Search:
```
$ ./enum-repo.sh
Choose your option: 1
Enter the directory to search: /var/www
Listing everything in /var/www...
/var/www/index.html
/var/www/admin
/var/www/config
```

### Using an External Wordlist:
```
$ ./enum-repo.sh
Choose your option: 2
Enter the path to the wordlist: /path/to/wordlist.txt
Enter the directory to search: /var/www
Searching for entries from the wordlist in /var/www...
Found: /var/www/admin
Found: /var/www/config
```

### Search by Name:
```
$ ./enum-repo.sh
Choose your option: 3
Enter the directory to search: /var/www
Enter the name to search for: admin
Searching for 'admin' in /var/www...
/var/www/admin
```

### Search by Extension:
```
$ ./enum-repo.sh
Choose your option: 4
Enter the directory to search: /var/www
Enter the extension to search for (e.g., .txt): .php
Searching for files with extension .php in /var/www...
/var/www/index.php
/var/www/config.php
```

### Search for Files Only:
```
$ ./enum-repo.sh
Choose your option: 5
Enter the directory to search: /var/www
Listing only files in /var/www...
/var/www/index.html
/var/www/index.php
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
