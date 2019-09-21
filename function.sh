function mytest {
    "$@"
    
    local status=$?
    echo  -ne $@
    if [ $status -ne 0 ]; then
        echo " -  $(tput setaf 1)[ERROR]$(tput sgr 0)" >&2
    else
        echo -e "  — $(tput setaf 2)[OK]$(tput sgr 0)"
    fi
    return $status
}

