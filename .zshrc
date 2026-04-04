eval "$(starship init zsh)"

export XCURSOR_THEME=breeze_cursors
export XCURSOR_SIZE=24

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

alias ls='ls --color=auto'
alias poweroff='poweroff --no-wall'
alias reboot='reboot --no-wall'
alias vim=nvim

export EDITOR=nvim
export PATH=$HOME/bin:$PATH

set -o emacs
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
tabs 4

eval "$(zoxide init zsh)"
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[2~" overwrite-mode
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey "^[[5~" history-search-backward
bindkey "^[[6~" history-search-forward
#bindkey '\e[1;3C' history-beginning-search-backward
#bindkey '\e[1;3D' history-beginning-search-forward
#bindkey '\e[1;3A' history-beginning-search-backward
#bindkey '\e[1;3B' history-beginning-search-forward

bindkey -r "^[OP"
bindkey -r "^[OQ"
bindkey -r "^[OR"
bindkey -r "^[OS"
bindkey -r "^[[15~"
bindkey -r "^[[17~"
bindkey -r "^[[18~"
bindkey -r "^[[19~"
bindkey -r "^[[20~"
bindkey -r "^[[21~"
bindkey -r "^[[23~"
bindkey -r "^[[24~"

bindkey -s "^[OP" ""
bindkey -s "^[OQ" ""
bindkey -s "^[OR" ""
bindkey -s "^[OS" ""
bindkey -s "^[[15~" ""
bindkey -s "^[[17~" ""
bindkey -s "^[[18~" ""
bindkey -s "^[[19~" ""
bindkey -s "^[[20~" ""
bindkey -s "^[[21~" ""
bindkey -s "^[[23~" ""
bindkey -s "^[[24~" ""

return

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"
