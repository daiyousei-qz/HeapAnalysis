#! /bin/bash

if [[ ! -d ./src ]]
then
    mkdir src
fi

if [[ -d ./bc ]]
then
    rm ./bc -r
fi

if [[ -d ./ll ]]
then
    rm ./ll -r
fi

mkdir bc
mkdir ll

for f in ./src/*.c
do
    name=$(basename -s .c $f)
    clang -S -emit-llvm $f -o ./ll/$name.ll
done

for f in ./ll/*.ll
do
    name=$(basename -s .ll $f)
    llvm-as-9 $f -o ./bc/$name.bc
done

    
