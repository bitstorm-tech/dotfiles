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
alias c='clear'
alias gomodup='go get -u ./... && go mod tidy'
alias brewup='brew upgrade && brew cleanup && brew autoremove'
alias e='emacs'

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
