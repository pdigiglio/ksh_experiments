#!/bin/ksh

typeset -r version="$0 0.0.1"

function is_integer {
    typeset integer="$1"
    typeset -i integer
    [[ "${integer}" == "${1}" ]]
}

# Parse command line options with getopts.
# NOTE Cannot force numeric arguments (i.e. with '#') as in getopts
typeset    cmd_line_opts=$(getopt --name "$0" --options "Vvd:m:" --longoptions "version,verbose,debug-level:,memory:,debug-file:" -- "$@") ec=$?
typeset -r cmd_line_opts
typeset -i ec

if [[ ${ec} -ne 0 ]]
then
    return ${ec}
fi

eval set -- "${cmd_line_opts}"

echo "${cmd_line_opts}"
echo ""

typeset -i memory
typeset -i debug_level
typeset debug_file

while [[ $# -gt 0 ]]
do
    typeset opt="$1"
    case "${opt}" in
        "-V"|"--version")
            echo ${version}
            ;;

        "-m"|"--memory")
            if is_integer "$2"
            then
                memory=$2
            else
                echo "${opt}: argument '$2' is not an integer"
                return 1
            fi

            shift
            ;;

        "-d"|"--debug-level")
            if is_integer "$2"
            then
                debug_level=$2
            else
                echo "${opt}: argument '$2' is not an integer"
                return 1
            fi

            shift
            ;;



        #"debug-file")
            

        "--")
            break
            ;;
    esac

    shift
done

echo "memory=$memory"
echo "debug_level=$debug_level"
echo "debug_file=$debug_file"
