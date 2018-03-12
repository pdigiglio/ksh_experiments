#!/bin/ksh

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
