~/Documents/Projects/Bash/ufetch
echo -ne '\e[5 q' #beam shaped cursor

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# PS1="%F{blue}[%~] "

#Load pywal colors
# (cat ~/.cache/wal/sequences &) && clear

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.cache/zsh/history"
ZSH_AUTOSUGGEST_USE_ASYNC=1
#One history for terminals
setopt share_history

# Basic auto/tab complete:
autoload -U compinit && compinit
_comp_options+=(globdots)		# Include hidden files.
setopt globdots
zstyle ':completion:*' menu select
zmodload zsh/complist

#Auto complete with case insensivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# vi mode
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char
#Enable Reverse search
bindkey '^R' history-incremental-search-backward
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^[l' autosuggest-accept 
bindkey '^[L' forward-word
bindkey '^H' backward-kill-word
# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/exportrc" ] && source "$HOME/.config/exportrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/functionrc" ] && source "$HOME/.config/functionrc"
#Fuzzy file finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

 # Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

source /usr/share/autojump/autojump.zsh
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ninrod/pass-zsh-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "softmoth/zsh-vim-mode"
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug load
