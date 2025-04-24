# Path configuration
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/otavio/go/bin
export PATH=$PATH:/home/otavio/.local/scripts
export PATH=$PATH:/home/otavio/.python-env/bin/

# Editor configuration
export EDITOR='/bin/nvim'
export TERM=xterm-256color

# Aliases
alias tmux='tmux -2'
alias v=nvim
alias python=~/.python-env/bin/python3.13
alias pip=~/.python-env/bin/pip3
alias st0="shutdown -tf 0"
alias ls="ls --color=auto"

# Tmux configuration
if tmux has-session 2>/dev/null; then
  tmux source-file ~/.tmux.conf
fi

# Basic zsh configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups

# Enable completion
autoload -Uz compinit
compinit

# Custom prompt with git branch and current directory
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '[%b]'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'

setopt prompt_subst
PROMPT='%F{green}${vcs_info_msg_0_}%f%F{blue}[%~]%f$ '

if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
fi
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
fi

# Bind Keys
bindkey '^P' up-history
bindkey '^N' down-history
# Enhanced Key Bindings (Oh-My-Zsh style)
bindkey -e                                        # Emacs keybindings (recommended)
bindkey '^[[A' up-line-or-search                  # Up arrow - history search
bindkey '^[[B' down-line-or-search                # Down arrow - history search
bindkey '^[OA' up-line-or-search                  # Alternative up arrow (some terminals)
bindkey '^[OB' down-line-or-search                # Alternative down arrow
bindkey '^R' history-incremental-search-backward  # Ctrl+R - history search
bindkey '^A' beginning-of-line                    # Ctrl+A - move to start
bindkey '^E' end-of-line                          # Ctrl+E - move to end
bindkey '^[b' backward-word                       # Alt+B - back one word
bindkey '^[f' forward-word                        # Alt+F - forward one word
bindkey '^[[3~' delete-char                       # Delete key
bindkey '^H' backward-delete-word                 # Ctrl+Backspace - delete word
bindkey '^[d' kill-word                           # Alt+D - delete word forward
bindkey '^U' backward-kill-line                   # Ctrl+U - delete to start
bindkey '^K' kill-line                            # Ctrl+K - delete to end
bindkey '^Y' yank                                 # Ctrl+Y - paste
bindkey '^W' backward-kill-word                   # Ctrl+W - delete previous word

# Disable Ctrl+S and Ctrl+Q flow control
stty -ixon

