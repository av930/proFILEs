# below code should be called from ~/.bashrc
# usually called from .bash_aliases

printf '[%s] runned: [%s:%s] sourced\n' "$0" "$BASH_SOURCE" "$LINENO"
if [ -f "${proFILEdir}/.bashrc" ]; then source "${proFILEdir}/.bashrc"; fi

echo -e "${magenta}"
cat<< COMMENT 
******************************************************************
*     ______   _______           _______  _______  _______ 
*    (  __  \ (  ____ \|\     /|(  ___  )(  ____ )(  ____ \\
*    | (  \  )| (    \/| )   ( || (   ) || (    )|| (    \/
*    | |   ) || (__    | |   | || |   | || (____)|| (_____ 
*    | |   | ||  __)   ( (   ) )| |   | ||  _____)(_____  )
*    | |   ) || (       \ \_/ / | |   | || (            ) |
*    | (__/  )| (____/\  \   /  | (___) || )      /\____) |
*    (______/ (_______/   \_/   (_______)|/       \_______)
*
******************************************************************
COMMENT
printf "${brown}Today is  %s\n" "$(date +'%Y/%m/%d/%a [%H:%M:%S]')"
printf "Server is %s [%s]\n" "$(hostname)" "$(hostname -i)"
printf "==================================================================\n${NCOL}"

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
