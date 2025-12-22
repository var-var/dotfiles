#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

wiki-search() {
  local wiki_dir="$HOME/vimwiki"

  if [ ! -d "$wiki_dir" ]; then
    echo "Wiki-папка не найдена: $wiki_dir"
    return 1
  fi

  grep -i --color=always --line-number "$1" "$wiki_dir"/*.md |\
  fzf --ansi \
      --delimiter ':' \
      --preview '
	FILE=$(echo {} | cut -d":" -f1)
	LINE=$(echo {} | cut -d":" -f2)

		if [ -f "$FILE" ]; then
  		START=$((LINE - 7))
  		[ "$START" -lt 1 ] && START=1
  		END=$((LINE + 7))

  		HIGHLIGHT_LINE=$((LINE - START + 1))
 		HIGHLIGHT_SECOND_LINE=$((HIGHLIGHT_LINE + 1))

  		sed -n "${START},${END}p" "$FILE" |\
		       	sed "${HIGHLIGHT_LINE}s/.*/\x1b[1;36m&\x1b[0m/" |\
		       	sed "${HIGHLIGHT_SECOND_LINE}s/.*/\x1b[1;36m&\x1b[0m/"
		fi
		'\
      --preview-window 'up:60%:wrap' \
      --header 'j/k — перемещение, Enter — открыть в Vim' \
      --bind 'enter:execute(
          FILE=$(echo {} | cut -d":" -f1);
          LINE=$(echo {} | cut -d":" -f2);
          vim +$LINE "$FILE"
        )' \
      --bind 'k:up' \
      --bind 'j:down'
}


export KEYTIMEOUT=1
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

#history settings
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL="ignoreboth:erasedups"
shopt -s histappend
export PROMPT_COMMAND="history -a"
#export HISTIGNORE="ls:ls *:pwd:cd:cd ~:exit:&:shutdown:reboot:poweroff:halt:init 0:init 6:systemctl poweroff:systemctl reboot"
#"export HISTIGNORE="ls:ls *:pwd:cd:cd ~:exit:&:shutdown *:reboot *:poweroff:halt:init 0:init 6:systemctl poweroff:systemctl reboot:history:sudo reboot * sudo shutdown *"
export HISTIGNORE="&:exit:halt:reboot:shutdown"

#alises
alias calendar='khal calendar'
