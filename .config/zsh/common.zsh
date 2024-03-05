eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init --cmd cd zsh)"

export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

alias ll='ls -lh --color --group-directories-first'
alias la='ll -a'
alias lg='lazygit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vi='nvim'
alias dotfiles='chezmoi'
alias dotedit='dotfiles edit --watch'

eval "$(starship init zsh)"
