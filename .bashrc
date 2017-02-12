### Mise en version des fichiers de configuration bash
# $Id: bashrc 13 2006-12-25 21:38:47Z demo $
######### CONF
# 1=YES  
DANGEROUS_SHELL=0

### Directory colors
#
if [ -e ~/.dircolors ]
then
	eval `dircolors ~/.dircolors`
fi

#JAVA
export JAVA_HOME=/opt/java
export CLASSPATH=./build/

#SHELL
export PATH="$JAVA_HOME/bin/:$PATH:/opt/openoffice.org2.0/program:~/bin"

#LATEX
export TEXINPUTS=".:/usr/share/texmf-texlive/tex//:"

#SNMP
snmp_option="-c staff -v 1 localhost"

######### CODE 

HELP_ALIAS="ALIAS MAP:\n----------\n\
lsa\t: ls -al\n\
lsh\t: ls -alth\n\
psg\t: ps aux |grep \$1\n\
DEBIAN\n\
------\n\
apts\t:search\n\
aptg\t:get\n\
aptud\t:update\n\
aptug\t:upgrade\n\
GENTOO\n\
------\n\
ems\t:search\n\
emg\t:get\n\
emu\t:update\n\
emw\t:update world\n\
emwp\t:update world pretend\n"


##### ALIAS
 #DIVERS
alias mp='mplayernfs -fs -ao alsa:device=hw=0,0 -vo gl'
alias amsn='/opt/amsn/bin/amsn'
alias ?='echo -e $HELP_ALIAS'
alias ls='ls -l'
alias lsa='ls --color=auto -al'
alias lh='ls --color=auto -alth'
alias route='route -n'
alias psg="ps aux | grep $1"
alias mplayernfs="mplayer -cache 32684 -cache-min 50"
alias mplayertv="mplayernfs -fs -ao alsa:device=hw=1.3 -vo gl"
alias awesometest="Xephyr -ac -br -noreset -screen 800x600 :1"
alias eclipse="/home/demo/soft/eclipse/eclipse"

#alias emacs="/opt/emacs22.0.97/bin/emacs"
alias dtc="ssh" 
 # reboot en mode DANGEROUS
function frebout()
{
	echo -e "\033[5;31m***** WARNING ***** \033[0;m"
	echo -n "Y/N ?"
	read choice
	if [ "$choice" == "Y" ]
	then
		/sbin/reboot	
	fi
}
 # halt en mode DANGEROUS
function frebout()
{
	echo -e "\033[5;31m***** WARNING HALT ***** \033[0;m"
	echo -n "Y/N ?"
	read choice
	if [ "$choice" == "Y" ]
	then
		/sbin/halt	
	fi
}

if [ "$DANGEROUS_SHELL" -eq 0 ]; then
alias reboot='frebout'
alias halt='fhalt'
fi


 #DEBIAN
alias apts='apt-cache search $*'
alias aptg='apt-get install $*'
alias aptud='apt-get update'
alias aptup='apt-get upgrade'

 #GENTOO
alias ems='emerge -spv $*'
alias emg='emerge $*'
alias emu='emerge -u $*'
alias emuw='emerge -u world'
alias emw='emerge -upv world'


alias snmpget="snmpget $snmp_option $*"
alias snmpset="snmpset $snmp_option $*"
alias snmpwalk="snmpwalk $snmp_option $*"
alias snmptable="snmptable $snmp_option $*"

alias issterm="stterm -f 'Sauce Code Powerline:style=Medium,Regular:size=15'"
alias rdesk="rdesktop -k fr -u Administrateur $*"
alias mutt="mutt -f /home/demo/Maildir"
alias xmms="audacious"

## PROMPT
if [ "`id -u`" -eq 0 ]; then
P_R="\[\033[1;31m\]# \[\033[0;m\]"
else
P_R="%"
fi

function git-branch-name 
{
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}

function git-branch-prompt 
{
    local branch=`git-branch-name`
    if [ $branch ]; then printf " [%s]" $branch; fi
}

# mode
theshellmode()
{
    if [ "$DANGEROUS_SHELL" = "0" ]; then
    PS1="\[\033[1;32m\][\[\033[0;m\]\h:\w\[\033[1;32m\]]\[\033[0;m\]$P_R "
    else
    PS1="\[\033[1;32m\][\[\033[1;33m\h\[\033[0;m:\w\[\033[1;32m\]]\[\033[0;m\]$P_R "
    fi

}

thedevmode()
{
    if [ "$DANGEROUS_SHELL" = "0" ]; then
        PS1="\[\033[1;32m\][\[\033[0;m\]\h:\w\[\033[1;32m\]]\[\033[0;m\]$(git-branch-prompt)$P_R "
    else
        PS1="\[\033[1;32m\][\[\033[1;33m\h\[\033[0;m:\w\[\033[1;32m\]]\[\033[0;m\]$(git-branch-prompt)$P_R "
    fi
}


alias modedev="thedevmode"
alias modeshell="theshellmode"

modeshell
alias docker="sudo docker"
