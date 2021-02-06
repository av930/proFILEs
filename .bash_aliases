# below code should be called from ~/.bashrc
# usually called from .bash_aliases

printf '[%s] runned: [%s:%s] sourced\n' "$0" "$BASH_SOURCE" "$LINENO"
if [ -f "${proFILEdir}/.bashrc" ]; then source "${proFILEdir}/.bashrc"; fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
