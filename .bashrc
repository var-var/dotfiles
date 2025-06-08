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
