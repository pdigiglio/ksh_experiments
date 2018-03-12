#!/bin/ksh

function get_this_script_path {
    print "$(dirname ${.sh.file})"
}

function get_this_script_name {
    print "$(basename ${.sh.file})"
}
