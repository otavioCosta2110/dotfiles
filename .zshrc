export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"
plugins=(git)

source $ZSH/oh-my-zsh.sh
# Path configuration
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/otavio/go/bin
export PATH=$PATH:/home/otavio/.local/scripts
export PATH=$PATH:/home/otavio/.python-env/bin/
export PATH=$PATH:/home/otavio/.cargo/bin

# Editor configuration
export EDITOR='/bin/nvim'
export TERM=xterm-256color

eval "$(zoxide init zsh)"
# Aliases
alias tmux='tmux -2'
alias v=nvim
# alias ls="ls --color=auto"
alias ls="exa --icons --color auto -g"
alias cd="z"

# Tmux configuration
if tmux has-session 2>/dev/null; then
  tmux source-file ~/.tmux.conf
fi


if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
fi
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
fi

