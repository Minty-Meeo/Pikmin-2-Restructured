#!/bin/sh

home="${0%/*}"
drop="${1%/*}"
ext="${1##*.}"

if [ "$home" = "$0" ]; then
    echo "Please add \"./\" to the start of the shell script path so it is actually a filepath."
    exit
fi

# Make sure NOD Tool is allowed to execute
chmod +x "$home/nodtool.linux"
if [ $? -eq 1 ]; then
    echo "chmod +x failed."
    exit
fi

echo "Welcome to the Pikmin 2 Restructured patcher!"

if [ $# -eq 0 ] || [ "$drop" = "$1" ]; then
    echo "Please pass the filepath to a Pikmin 2 USA v1.00 *.gcm file as an argument"
    exit
fi

if [ -d "$drop/root" ]; then
    echo "Please remove $drop/root".
    exit
fi

# Extract GCM
echo "Step 1) Extracting \"${1##/*}\" to \"$drop/root\".  This may take a while."
"$home/nodtool.linux" extract -c 2 "$1" "$drop/root"
if [ $? -eq  1 ]; then
    echo "Error while extracting"
    exit
fi

# Patch things
echo "Step 2) Restructuring filesystem and patching in new files."
sh "$home/restructure.sh" "$drop/root/files"
cp -r "$home/patch/files/"* "$drop/root/files"
cp -r "$home/patch/sys/"* "$drop/root/sys"

echo "Would you like to rebuild a new *.$ext and remove the root folder?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

# Rebuild GCM
echo "Step 3) Rebuilding new *.$ext at \"$drop/Pikmin 2 Restructured.$ext\"."
"$home/nodtool.linux" makegcn -c 2 "$drop/root" "$drop/Pikmin 2 Restructured.$ext"
if [ $? -eq  1 ]; then
    echo "Error while rebuilding"
    exit
fi

# Cleanup
echo "Step 4) Removing \"$drop/root\" folder"
rm -f -r "$drop/root"
