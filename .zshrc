# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/adnan.maleskic/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

getPath() {
	if [ $PWD = $HOME ]; then
		echo "~"
	elif [ $(echo $PWD | sed 's/\//\'$'\n''/g' | wc -l) = 4 ] && [[ $PWD == /Users/adnan.maleskic*  ]]; then
		echo $( echo $PWD | sed "s/\/Users\/adnan\.maleskic/\~/g" )
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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=~/nvim/bin:~/myscripts:$PATH

tmux new -As0
