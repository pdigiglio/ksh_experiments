#!/bin/ksh

. ./lib.sh

#function get_this_script_path {
#    print "$(dirname ${.sh.file})"
#}
#
#function get_this_script_name {
#    print "$(basename ${.sh.file})"
#}

print "Executing the script '$(get_this_script_name)' in '$(get_this_script_path)'"
