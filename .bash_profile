# below code should be called from interactive shell
# please notice if .bash_profile is existed, .profile is not executed. 


echo "########################################################## KJK"
printf '[%s] runned: [%s] sourced\n' "$0" "$BASH_SOURCE"
proFILEdir=.proFILEs
proFILEdirOS='unknown'

if [ $(expr match "$OSTYPE" 'cygwin') -ne 0 ]
then proFILEdirOS=${proFILEdir}/cygwin
else proFILEdirOS=${proFILEdir}/linux
fi
export proFILEdir proFILEdirOS

printf '[%s] runned: [%s] sourced\n' "$0" "$BASH_SOURCE"
USR_FILE=${proFILEdir}/.profile
if [ -f "${USR_FILE}" ]; then source "${USR_FILE}" ;fi

if [[ ! -x $(which screen)  &&  -x $(which byobu) ]];then
#run byobu but don't exit the terminal when it's down.
case "$-" in *i*) byobu-launcher; esac
fi

