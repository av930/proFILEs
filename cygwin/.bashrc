#------------------------------ cygwin -----------------------------------------
# The absolute path must be eliminated within this file
# 이 파일에는 절대 path가 없어야 합니다.
############################## Prompt DEFINE #####################################

############################### USER DEFINE #####################################

############################### DIR ALIAS #####################################
while read -r -a element
do
    if [ "${element[0]//\"}" == "ALIAS" ]; then
        eval $(echo  alias ${element[1]}=${element[2]//\\/\/} ${element[3]//\\/\/})
    else
        :
    fi
done < ${DIR_SETTING}/_SetupProgram/setting-public.txt


############################### Tool ALIAS #####################################
function launch_cur_dir()
{
    echo $(cygpath -wp $PWD)
}

alias xming='export DISPLAY=localhost:0.0'

alias nt='rxvt -rv -sr -sw -sl 9999 -fg black -bg white -fn "Lucida Sans Typewriter" -mcc -ls -g 100X50 -e /usr/bin/bash --login -i &'

alias  gvi="VIMINIT=':so ~/.vim/.vimrc' MYVIMRC='~/.vim/.vimrc' /cygdrive/c/DevTools/gVim/vim74/gvim.exe $* &"
alias gvip="VIMINIT=':so ~/.vim/.vimrc_backup' MYVIMRC='~/.vim/.vimrc_backup' /cygdrive/c/DevTools/gVim/vim74/gvim.exe $* &"
alias gviu="VIMINIT=':so ~/.viu/.vimrc' MYVIMRC='~/.viu/.vimrc' /cygdrive/c/DevTools/gVim/vim74/gvim.exe $* &"
alias gvio="VIMINIT=':so ~/.vio/.vimrc' MYVIMRC='~/.vio/.vimrc' /cygdrive/c/DevTools/gVim/vim74/gvim.exe $* &"

alias updateDonut='rsync -auvht --port=873 172.21.74.32::$USER/mydonut/*  /cygdrive/d/SRC_WORK/Donut/'
alias updateEclair='rsync -auvht --port=873 172.21.74.32::$USER/myeclair/* /cygdrive/d/SRC_WORK/Eclair/'
alias updateCapp='rsync -auvht --exclude-from=exclude.txt --port=873 172.21.74.32::$USER/capp/* /cygdrive/d/SRC_WORK/capp/'
    
############################### ENV DEFINE ######################################
alias set-lint='LARCH_PATH=$DEVTOOLS/GnuTool/SPLint/lib;
                LCLIMPORTDIR=$DEVTOOLS/GnuTool/SPLint/imports;
                PATH=$DEVTOOLS/GnuTool/SPLint/bin:$PATH'

function set-sdk(){
    export PATH=${SRC_SDK}/platform-tools:${SRC_SDK}/tools:$PATH;
    export ANDROID_PRODUCT_OUT=${SRC_FULL}/out/target/product/generic
    export USE_CYGWIN=1 #refer HOST_windows-x86.mk for cygwin building 

}


############################### Utility #####################################
printf '[%s] runned: [%s:%s] sourced\n' "$0" "$BASH_SOURCE" "$LINENO"
