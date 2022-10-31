#!/bin/bash

posname=$(ls input/pos)
negname=$(ls input/neg)

javac P1.java

if [[ $1 == "all" ]]
then
    for f in $posname
    do
        echo "Processing pos/$f"
        java P1 < input/pos/$f > output/pos/$f 2>/dev/null
        if [[ $(cat output/pos/$f) != "Program type checked successfully" ]]
        then
            echo "----->" "sed: " $(cat output/pos/$f)
        else
            echo "----->" "Noice"
        fi
    done
    for f in $negname
    do
        echo "Processing neg/$f"
        java P1 < input/neg/$f > output/neg/$f 2>/dev/null
        if [[ $(cat output/neg/$f) != "Type error" ]]
        then
            echo "----->" "sed: " $(cat output/neg/$f)
        else
            echo "----->" "Noice"
        fi
    done
else
    java P1 <input/$1 >output/$1
fi
