#------------------------------ linux -----------------------------------------
############################## Prompt DEFINE #####################################
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1="\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\$PWD\[\033[00m\]\$\n\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

############################### USER DEFINE #####################################



############################### DIR ALIAS #####################################



############################### Tool ALIAS #####################################
function launch_cur_dir()
{
    ip_addr=$(hostname -I |cut  -f1 -d' ')
    home_name=$(dirname $HOME)
    #print scp path dir
    #echo "$(whoami)@$ip_addr:$proFILEdir/.path.log"
    #print current path as windows type
    path=$(pwd|sed "s:$home_name:\/\/$ip_addr:"|sed 's:\/:\\:g')
    echo "$path" | tee ${HOME}/.proFILEs/.path.log
}

function xming()
{
    Command=$(w|awk '/joongkeu/ {print $3}'|sed 's/:.*//' |sort -u); 
    export DISPLAY=${Command}:0.0
}


############################### ENV DEFINE ######################################
function set_sdk(){
    export PATH=${SRC_SDK}/platform-tools:${SRC_SDK}/tools:~/bin/LGANT:$PATH;
    export ANDROID_PRODUCT_OUT=${SRC_FULL}/out/target/product/generic

}
    
function java15()
{
JAVA_HOME=$JAVA_15HOME
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/activation.jar
PATH=.:$JAVA_HOME/bin:$PATH
}


function java16()
{
JAVA_HOME=$JAVA_16HOME
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/activation.jar
PATH=.:$JAVA_HOME/bin:$PATH
}

############################### Utility #####################################
printf '[%s] runned: [%s:%s] sourced\n' "$0" "$BASH_SOURCE" "$LINENO"
