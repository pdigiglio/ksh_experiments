#!/bin/ksh

. ./lib.sh

var="non-default"

print "var = $var"
set_to_default_value var
print "var = $var"

print '--- This should signal an error ---'
set_to_default_value 
print '-----------------------------------'
