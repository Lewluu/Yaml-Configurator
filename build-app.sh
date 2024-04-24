#!/bin/bash

# manage bash script to exit if any called command exit with non-zero value
set -e

log_debug="[::: BUILD DEBUG :::] "
log_info="[::: BUILD INFO :::] "
log_warning="[::: BUILD WARNING :::] "
log_error="[::: BUILD ERROR :::] "

declare -A targets

targets=(
    ["VS17"]="Visual Studio 17 2022"
    ["VS16"]="Visual Studio 16 2019"
    ["VS15"]="Visual Studio 15 2017"
    ["VS14"]="Visual Studio 14 2015"
    ["MinGW"]="MinGW Makefiles"
    ["NMake"]="NMake Makefiles"
    ["MSYS"]="MSYS Makefiles"
    ["Unix"]="Unix Makefiles"
)

# get compiler paths
gxx=`which g++`
gcc=`which gcc`

echo $log_debug' '$gxx
echo $log_debug' '$gcc

while getopts t: flag
do
    case "${flag}" in
        t) target=${OPTARG};;
    esac
done

# detecting the target build
if [ -z "$target" ]
then
    echo $log_warning"Target is empty ... setting default to MinGW"
    target="MinGW Makefiles"
else
    for t in "${!targets[@]}"
    do
        if [ "$target" == "$t" ]
        then
            target=${targets[$t]}
            echo -e "\n"$log_info"Target to build set to "$target
            break
        fi
    done
fi

# TO DO
# if clean flag is on, remove build folder, or other sub-components
rm -rf build/
mkdir build

# calling cmake and make commands
echo $log_info'Calling command: cmake -S . -G ''"'${target}'"' -B build/ -D CMAKE_C_COMPILER=$gcc -D CMAKE_CXX_COMPILER=$gxx
cmake -S . -G ''"${target}"'' -B build/ -D CMAKE_C_COMPILER=$gcc -D CMAKE_CXX_COMPILER=$gxx | sed -e 's/^/'"${log_debug}"'/;'

cd build/
echo $log_info'Calling command: make'
'make' | sed -e 's/^/'"${log_debug}"'/;'