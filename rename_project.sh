#!/bin/sh

# This script must be launch from root directory

function print_usage()
{
    echo "Usage: ./rename_project_exe.sh <your_project_name>"
}

function rename_project_exe()
{
    for file in $(find . -name 'CMakeLists.txt' -o -name '.gitignore')
    do
        sed -i -E "s/project_name/$1/g" $file
    done
}

if [ $# -ne 1 ]; then
    print_usage "$1"
    exit 1
fi

case $1 in
    -h)
        print_usage "$1";;
    *)
        rename_project_exe "$1";;
esac
