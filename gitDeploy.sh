
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

git status
read -r -p 'Commit message: ' desc  # prompt user for commit message
git add .                           # track all files
git add -u                          # track deletes
git commit -m "$desc"               # commit with message
git push               # push to origin
