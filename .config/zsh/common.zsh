export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias ll='ls -lh --color --group-directories-first'
alias la='ll -a'
alias lg='lazygit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias c='clear'
alias e='emacs'
alias nv='neovide'
alias z='zellij'
alias igrep='grep -i'
alias artisan='php artisan'
alias python='python3'
alias py='python'

function gomodup { go get -u ./...; go mod tidy }
function brewup { brew upgrade; brew cleanup; brew autoremove }
function weztitle { wezterm cli set-tab-title $1 }

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
