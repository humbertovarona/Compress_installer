#!/bin/bash
TARBALL="$1_package.tar.gz"
EXECUTABLE="dist/$1"
if [ ! -f "$EXECUTABLE" ]; then
    echo "Error: Executable not found. Please compile with PyInstaller first."
    exit 1
fi
mkdir -p $1_package
cp "$EXECUTABLE" $1_package/
echo "Collecting shared libraries..."
ldd "$EXECUTABLE" | grep "=>" | awk '{print $3}' | xargs -I '{}' cp '{}' $1_package/
echo "Creating $TARBALL with executable and libraries..."
tar -czvf "$TARBALL" $1_package
rm -rf $1_package
echo "Compression complete. The file $TARBALL is ready to be transferred."
