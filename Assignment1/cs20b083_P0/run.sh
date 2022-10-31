#!/usr/bin/env bash

mac_test=$(ls testcases/macro_tests)
neg_test=$(ls testcases/negative)
pos_test=$(ls testcases/positive)

make clean
make A1.exe

for i in ${mac_test[@]}; do
    ./A1.exe < testcases/macro_tests/$i > testcases/macOut/$i
done

for i in ${neg_test[@]}; do
    ./A1.exe < testcases/negative/$i > testcases/negOut/$i
done

for i in ${pos_test[@]}; do
    ./A1.exe < testcases/positive/$i > testcases/posOut/$i
done