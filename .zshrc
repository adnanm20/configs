# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adnan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/adnan/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/adnan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/adnan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/adnan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

getPath() {
	if [ $PWD = $HOME ]; then
		echo "~"
	elif [ $(echo $PWD | sed 's/\//\'$'\n''/g' | wc -l) = 4 ] && [[ $PWD == /home/adnan*  ]]; then
		echo $( echo $PWD | sed "s/\/home\/adnan/\~/g" )
	else
		echo "%2d"
	fi
}
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST
PROMPT='%K{#111111}%F{white}$(getPath)%f%F{green}${vcs_info_msg_0_}%f
$%k '

tmux new -As0

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=~/nvim/bin:~/scripts:$PATH

export QSYS_ROOTDIR="/home/adnan/intelFPGA_lite/21.1/quartus/sopc_builder/bin"
