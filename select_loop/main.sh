#!/bin/ksh

#print "Select your terminal type:"
#
## Set the select prompt
#PS3="terminal? "
#select term in "Gicalt GL35a" "Tsoris T-2000" "Shande 531" "Vey VT99"
#do
#    case $REPLY in
#        1)
#            TERM="g135a"
#            ;;
#        2)
#            TERM="t2000"
#            ;;
#        3)
#            TERM="s531"
#            ;;
#        4)
#            TERM="vt99"
#            ;;
#        *)
#            print "Invalid choice"
#            ;;
#    esac
#
#    if [[ -n "${term}" ]]
#    then
#        print "TERM = ${TERM}"
#        break
#    fi
#done


# Do the same with an array variable
typeset -rA termnames=(
["Givalt GL35a"]="g135a"
["Tsoris T-2000"]="t2000"
["Shande 531"]="s531"
["Vey VT99"]="vt99"
)

print '[Array version] Select your terminal type:'
PS3="terminal? "
select term in "${!termnames[@]}" # List the indices
do
    if [[ -n "${term}" ]]
    then
        TERM=${termnames["$term"]}
        print "TERM = ${TERM}"
        break
    fi
done
