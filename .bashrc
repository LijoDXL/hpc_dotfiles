# .bashrc
# Source global definitions

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# cd /incois_ncmrwfx/incois/hycom/
ulimit -s unlimited

#---------------------added by lijo------------------------#

# defining colors for ls
eval `dircolors $HOME/.dotfiles/.dircolors` #for better colors in ls

#-----------------------Aliases----------------------------#
alias adidf='curl -sL http://10.4.9.100/Aaditya_Utilization/index.php |grep incois'
alias tma='tmux -2u attach'
alias pd='pushd .'
alias dirs='dirs -v'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias jn='cd /incois_ncmrwfx/incois_tccsym/JupyterNotebooks'

# aliases for HWRF workflow
alias h='cd /incois_ncmrwfx/incois/hycom/'
alias hp='cd /incois_ncmrwfx/incois/hycom/HWRF_parent/'
alias ho='cd /incois_ncmrwfx/incois_tccsym/OUTPUTS/pytmp/'
alias hi='cd /incois_ncmrwfx/incois_tccsym/FORCING/'
alias hw='cd /incois_ncmrwfx/incois/hycom/HWRF_parent/hwrfrun/wrappers/'
alias hlog='cd /incois_ncmrwfx/incois/hycom/HWRF_parent/hwrfrun/wrappers/logs/'
alias hsrc='cd /incois_ncmrwfx/incois/hycom/HWRF_parent/hwrfrun/sorc/'

#exports for HWRF Workflow
hm=/incois_ncmrwfx/incois/hycom
hw=/incois_ncmrwfx/incois/hycom/HWRF_parent/hwrfrun/wrappers
hw4=/incois_ncmrwfx/incois/hycom/HWRF_v4.0/hwrfrun/wrappers
parm=/incois_ncmrwfx/incois/hycom/HWRF_parent/hwrfrun/parm
dsets=/incois_ncmrwfx/incois/hycom/dataset
hdsets=/incois_ncmrwfx/incois_tccsym/FORCING
ho=/incois_ncmrwfx/incois_tccsym/OUTPUTS/pytmp

# some more aliases
alias util='ssh -o PubkeyAuthentication=no  -X -t iitmutil03 "cd $PWD; bash --login"'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lrt='ls -lrt'
alias q='exit'
alias clr='clear'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bj='bjobs'
alias rm='rm -i'
alias die='bkill -q incois -u hycom 0'

#-----------------------Functions----------------------------#

#-----tail or edit lastest bsub error and output log file----#
#Usage: ts arg1 [arg2]
# arg1 : file tag, can only be err, error, out or output
# arg2 : any string; if exists, opens the file for editing

ts() { 
  if [ "$2" = "err" -o "$2" = "error" ]
  then
    tag="error"
  elif [ "$2" = "out" -o "$2" = "output" ]
  then
    tag="output"
  else
    echo "UNKNOWN argument: "$2"; USAGE: only out, output, err, error is recognized" >&2
    return 0
  fi
  if [ "$3" ]
  then
    vim $(ls -rt $hw/logs/$1*.${tag} | tail -1)
  else
    tail -f $(ls -rt $hw/logs/$1*.${tag} | tail -1)
  fi
} 

#-----using f instead of ferret for clean jnl management----#
#usage: f [your normal arguments to ferret]

f() {
  if [ -d $PWD/fjnl ]; then
    echo "I found fjnl"
  else 
    mkdir fjnl
    echo "fjnl created"
  fi
  ferret -nojnl $*
}

#----------adding PYF library path before activating the python env-------------#
# PYF() {
#   if [ "$1" = "on" -o "$1" = "ON" ]
#   then
#     export LD_LIBRARY_PATH=/moes/home/hycom/miniconda2/envs/PYF/lib:$LD_LIBRARY_PATH
#     source activate PYF
#   elif [ "$1" = "off" -o "$1" = "OFF" ]
#   then
#     source deactivate
#     export LD_LIBRARY_PATH=${LD_LIBRARY_PATH#/moes/home/hycom/miniconda2/envs/PYF/lib:}
#   else
#     echo "UNKNOWN argument: "$1"; USAGE: only on (ON) or off (OFF) is recognized" >&2
#     return 0
#   fi
# }
export PATH=$PATH:~/.ssh
alias nb="cd /incois_ncmrwfx/incois_tccsym/NIOT_BUOYS"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/incois_ncmrwfx/incois/hycom/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/incois_ncmrwfx/incois/hycom/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/incois_ncmrwfx/incois/hycom/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/incois_ncmrwfx/incois/hycom/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
########## Followed the link to add custom modules to PythonPath:############
#    https://stackoverflow.com/questions/37006114/anaconda-permanently-include-external-packages-like-in-pythonpath
########################
