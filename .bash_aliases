# below code should be called from ~/.bashrc
# usually called from .bash_aliases
cat<< COMMENT 
## sequence of login script
1st step: /etc/profile > /etc/profile.d/*.sh> .bash_profile(or .profile)
2nd step: .bashrc > /etc/bashrc
#########################################################################
COMMENT
hostname -i 
echo $USER

printf '[%s] runned: [%s:%s] sourced\n' "$0" "$BASH_SOURCE" "$LINENO"
if [ -f "${proFILEdir}/.bashrc" ]; then source "${proFILEdir}/.bashrc"; fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
