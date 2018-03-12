#!/bin/ksh

function backup_file {
    if [[ -z "$1" ]]
    then
        print "$0 : Error   : filename (\$1) must be given" > /dev/stderr
        return 1
    fi
    
    typeset -r orig_file="$1"
    typeset -r back_file="${orig_file}_$(date "+%G%m%d")"
    if [[ -f "${orig_file}" ]]
    then
        cp --verbose "${orig_file}" "${back_file}"
        return $?
    else
        print "$0 : Warning : can't find '${orig_file}', skipping backup" > /dev/stderr
    fi
}

function backup_file_and_overwrite {
    if [[ -z "$1" ]]
    then
        print "$0 : Error   : source filename (\$1) must be given" > /dev/stderr
        return 1
    fi
    typeset -r source_file="$1"

    if [[ -z "$2" ]]
    then
        print "$0 : Error   : destination filename (\$2) must be given" > /dev/stderr
        return 1
    fi
    typeset -r destination="$2"

    # Check if the destination is a directory only
    typeset destination_file
    if [[ -d "$destination" ]]
    then
        destination_file="${destination}/$(basename "${source_file}")"
    elif [[ -f "${destination}" ]]
    then
        destination_file="${destination}"
    else
        print "$0 : Error : '${destination}' is not a file nor a directory"
    fi

    backup_file "${destination_file}"
    if [[ $? -eq 0 ]]
    then
        cp --verbose "${source_file}" "${destination_file}"
    else
        print "$0 : backup filed; I didn't overwrite '${destination_file}'"
    fi
}

backup_file_and_overwrite "$1" "$2"
