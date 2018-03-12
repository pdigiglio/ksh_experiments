#!/bin/ksh

# Example: try to run it as
#  $ ./countargs.sh "Hi" "there" "to all"
# And see how arguments are handled

function countargs {
    #IFS=,
    print "$# arguments:"
    for i in "$@"
    do
        print " > '$i'"
    done
    print ""
}

print 'countargs  $*'
countargs  $*
print 'countargs "$*"'
countargs "$*"
print 'countargs  $@'
countargs  $@
print 'countargs "$@"'
countargs "$@"
