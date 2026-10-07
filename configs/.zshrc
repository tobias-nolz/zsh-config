# path
typeset -U path fpath
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
path=("$HOME/.local/bin" $path)
[[ -d "$XDG_DATA_HOME/fnm" ]] && path=("$XDG_DATA_HOME/fnm" $path)
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt extended_history share_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks hist_verify

# options
setopt auto_cd auto_pushd pushd_ignore_dups interactive_comments no_beep

# key bindings
bindkey -e
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^X^E' edit-command-line

# environment variables
source ~/.zsh/environmentrc

# plugins (antidote)
ANTIDOTE_HOME_DIR="${ANTIDOTE_HOME_DIR:-$HOME/.antidote}"
if [[ ! -d "$ANTIDOTE_HOME_DIR" ]] && (( $+commands[git] )); then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_HOME_DIR"
fi
if [[ -r "$ANTIDOTE_HOME_DIR/antidote.zsh" ]]; then
  zstyle ':antidote:bundle' use-friendly-names 'yes'
  source "$ANTIDOTE_HOME_DIR/antidote.zsh"
  function has-fzf { (( $+commands[fzf] )) }
  antidote load ~/.zsh/plugins.txt "$XDG_CACHE_HOME/zsh/plugins.zsh"
else
  autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
fi

# aliases (after plugins, so they win over oh-my-zsh defaults)
source ~/.zsh/aliasrc

# tools
(( $+commands[fnm] ))     && eval "$(fnm env --use-on-cd --shell zsh)"
(( $+commands[fzf] ))     && source <(fzf --zsh)
(( $+commands[zoxide] ))  && eval "$(zoxide init zsh)"
(( $+commands[starship] )) && eval "$(starship init zsh)"

# machine-specific settings (untracked)
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local
