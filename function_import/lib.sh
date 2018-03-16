#!/bin/ksh

# Avoid multiple inclusions of this library
if [[ -n "${__lib_sh}" ]]
then
    return
else
    typeset -ri __lib_sh=1
fi

function set_to_default_value {
    print "\$1 = '$1'"

    #typeset -r cod_soc=${2:-"011"}
    #print "\$cod_soc = '$cod_soc'"

    if [[ -z "$1" ]]
    then
        print 'set_to_default_value: argument $1 is mandatory' > /dev/stderr
        return 1
    fi

    typeset -n arg_reference=$1
    arg_reference="default"
}
