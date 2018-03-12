#!/bin/ksh

typeset -r first="I am first"
typeset -r second="I am in the middle"
typeset -r third="I am last"

nameref ref=first

for ref in first second third
do
    print "ref -> ${!ref} : ${!ref} = ${ref}"
done


