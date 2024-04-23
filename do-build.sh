#!/bin/bash

# manage bash script to exit if any called command exit with non-zero value
set -e

log_debug="[::: BUILD DEBUG :::] "
log_info="[::: BUILD INFO :::] "
log_warning="[::: BUILD WARNING :::] "
log_error="[::: BUILD ERROR :::] "

declare -A targets

targets=
    ["VS17"]="Visual Studio 17 2022"
    ["VS16"]="Visual Studio 16 2019"
    ["VS15"]="Visual Studio 15 2017"
    ["VS14"]="Visual Studio 14 2015"
    ["MinGW"]="MinGW Makefiles"
    ["NMake"]="NMake Makefiles"
    ["MSYS"]="MSYS Makefiles"
    ["Unix"]="Unix Makefiles"

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

mkdir build
echo -e $log_info"Changing path to build"
cd build

# calling cmake and make commands
echo $info_msg'Calling command: cmake ../ -G ''"'${target}'"'
cmake ../ -G''"${target}"'' | sed -e 's/^/'"${debug_msg}"'/;'

echo $info_msg'Calling command: make'
'make' | sed -e 's/^/'"${debug_msg}"'/;'