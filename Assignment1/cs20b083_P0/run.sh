#!/bin/bash

green='\033[0;37m'
red='\033[0;32m'
clear='\033[0m'

if [[ $# == 0 ]]; then
    echo -e "Use -h flag for help"
    exit 1
fi

if [[ $# == 1 ]] && [[ $1 == "-h" ]]; then
    echo "Usage: ./run.sh [flags] <files>"
    echo ""
    echo "flags:"
    echo "-h                show this help message"
    echo "-m                run macro tests"
    echo "-n                run negative tests"
    echo "-p                run positive tests"
    echo "-debug            run tests in debug mode, will print your output when wrong"
    exit 1
fi

nt=0
pt=0
mt=0
debug=0
stop=0
total=0
pass=0
files=()

for i in $(seq 1 $#)
do
    if [[ ${!i} == "-debug" ]]; then
        debug=1
    elif [[ ${!i} == "-n" ]]; then
        nt=1
    elif [[ ${!i} == "-p" ]]; then
        pt=1
    elif [[ ${!i} == "-m" ]]; then
        mt=1
    fi
done

make A1.exe

if [[ $nt == 1 ]]; then
    files=$(ls tests/input/negative)
    for file in $files
    do
        total=$((total+1))
        echo "----------------------------------------------"
        echo Processing $file
        ./A1.exe < tests/input/negative/$file > tests/output/negative/$file
        if [[ $(cat tests/output/negative/$file) == "//Failed to parse input code" ]]
        then
            echo -e "${green}Noice${clear}"
            pass=$((pass+1))
        else
            echo -e "${red}sed${clear}"
            if [[ $debug == 1 ]]; then
                cat tests/output/negative/$file
            fi
        fi
    done
fi

if [[ $pt == 1 ]]; then

    files=$(ls tests/input/positive)
    for file in $files
    do
        total=$((total+1))
        echo "----------------------------------------------"
        echo Processing $file
        ./A1.exe < tests/input/positive/$file > tests/output/positive/$file
        if [[ $(cat tests/output/positive/$file) != "//Failed to parse input code" ]]
        then
            echo -e "${green}Noice${clear}"
            pass=$((pass+1))
        else
            echo -e "${red}sed${clear}"
            if [[ $debug == 1 ]]; then
                cat tests/output/positive/$file
            fi
        fi
    done
fi

if [[ $mt == 1 ]]; then

    files=$(ls tests/input/macro)
    for file in $files
    do
        total=$((total+1))
        echo "----------------------------------------------"
        echo Processing $file
        ./A1.exe < tests/input/macro/$file > tests/output/macro/$file
        if [[ $(cat tests/output/macro/$file) != "//Failed to parse input code" ]]
        then
            echo -e "${green}Noice${clear}"
            pass=$((pass+1))
        else
            echo -e "${red}sed${clear}"
            if [[ $debug == 1 ]]; then
                cat tests/output/macro/$file
            fi
        fi
    done
fi

echo "------------------------------------------------"
echo "Processing done " $pass "/" $total " passed"