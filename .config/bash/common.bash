export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'

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
alias e='emacs -nw'
alias ec='emacsclient -nw'
alias nv='neovide'
alias z='zellij'
alias igrep='grep -i'
alias artisan='php artisan'
alias python='python3'
alias py='python'
# 'history 0' is zsh-only; bash's history already shows everything

gomodup() { go get -u ./...; go mod tidy; }
weztitle() { wezterm cli set-tab-title "$1"; }
gwa() {
	git worktree add ".worktrees/$1" -b "$1"
}

# eval "$(zoxide init --cmd cd bash)"
eval "$(starship init bash)"
