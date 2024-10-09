# Compress_installer

Compacts what is necessary for a python code compiled with pyInstaller to run

# Package Creation Script for Executable

This Bash script automates the packaging of a compiled executable and its shared libraries into a tarball (`.tar.gz` file). It is intended for use after compiling a Python application using PyInstaller.

## Requirements

Make sure the following conditions are met:

- The executable has been compiled with PyInstaller and is located in the `dist/` directory.
- `ldd` is available on your system (common in Unix-like systems).

## Usage

Run the script with the name of the executable (without file extension) as an argument:

```bash
./script_name.sh executable_name
```

Replace `script_name.sh` with the actual name of the Bash script file, and `executable_name` with the name of the compiled executable.

### Example:

```bash
./package_script.sh my_application
```

## How It Works

1. The script takes an argument for the executable's name.
2. It checks if the executable exists in the `dist/` directory.
3. A temporary directory named after the executable is created, and the executable is copied there.
4. The script uses `ldd` to list the shared libraries required by the executable and copies them into the temporary directory.
5. The temporary directory is compressed into a tarball (`.tar.gz`), which can be transferred or deployed.
6. The temporary directory is deleted after the tarball is created.

## Output

The script creates a tarball with the name `<executable_name>_package.tar.gz`, containing:

1. The compiled executable.
2. All shared libraries required by the executable.

## Notes

- Ensure that you have the necessary permissions to read the shared libraries and write to the current directory.
- If the executable is not found, the script will display an error message and exit.
- This script is intended for Unix-like systems where `ldd` is available.

## Troubleshooting

- If you receive an error stating "Executable not found," ensure that the compiled executable is located in the `dist/` directory.
- Make sure you have sufficient permissions to copy shared libraries.

## License

This project is licensed under the CC0 License - see the CC0 LICENSE file for details.
