############################## COMMON .profile#####################################
# common configuration
##################################################################
# LANG & Color
##################################################################
#과거 사용하던 version
#LANG=C.euckr
#LANG=en_US.UTF-8
#LANG=ko_KR.euckr

#현재 검증된 version
LANG=ko_KR.UTF-8

##### color code
red='\e[0;31m';     RED='\e[1;31m';     green='\e[0;32m';       GREEN='\e[1;32m';
yellow='\e[0;33m';  YELLOW='\e[1;33m';  blue='\e[0;34m';        BLUE='\e[1;34m';
cyan='\e[0;36m';    CYAN='\e[1;36m';    magenta='\e[0;35m';     brown='\e[0;33m';     
NCOL='\e[0m';


# find proFILEs path 
##################################################################
proFILEdir='.proFILEs'
proFILEdirOS='unknown'
if [ $(expr match "$OSTYPE" 'cygwin') -ne 0 ] 
then proFILEdirOS=${proFILEdir}/cygwin
else proFILEdirOS=${proFILEdir}/linux
fi


USR_FILE=~/profile.config
if [ -f "${USR_FILE}" ]
then source "${USR_FILE}" 
else source ${proFILEdir}/default.config
fi

export proFILEdir proFILEdirOS LANG red RED green GREEN yellow YELLOW blue BLUE cyan CYAN magenta brown NCOL 

printf '[%s] runned: [%s:%s] sourced\n' "$0" "$BASH_SOURCE" "$LINENO"
# specific profile
# check linux or cygwin and load profile
##################################################################
if [ -f "${proFILEdirOS}/.profile" ]; then source "${proFILEdirOS}/.profile" ;fi

# common configuration
# .bashrc
##################################################################
# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then source "${HOME}/.bashrc"; fi


# common configuration
# default path
#Set PATH so it includes user's private bin if it exists
##################################################################
PATH=".:${HOME}:${proFILEdir}/tools:${HOME}/bin:${PATH}"


# launch default shell emulator
# screen or byobu (default is screen)
##################################################################
if [[ ${SHLVL} -eq 1 && -x $(which screen) ]]; then
    #((SHLVL+=1)); export SHLVL
    #exec screen -R -e "^Ee" ${SHELL} -l
    #start screen if not using cygwin
    if [ "$OSTYPE" != "cygwin" ] && [ "$opt_screen" = "yes" ]; then screen -U -R; fi
fi
