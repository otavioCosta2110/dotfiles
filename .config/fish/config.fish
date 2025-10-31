if status is-interactive
  # Starship custom prompt
  set -gx PATH $HOME/bin $HOME/.local/bin /usr/local/bin $PATH
  set -gx PATH $PATH /home/otavio/go/bin
  set -gx PATH $PATH /home/otavio/.local/scripts
  set -gx PATH $PATH /home/otavio/.python-env/bin/
  set -gx PATH $PATH /home/otavio/.cargo/bin
  set -gx PATH $PATH /home/otavio/.bin
  set -gx PATH $PATH /usr/local/texlive/2025/bin/x86_64-linux

  set -gx EDITOR '/bin/nvim'
  set -gx TERM xterm-256color

  # Zoxide initialization
  zoxide init fish | source

  alias tmux='tmux -2'
  alias v=nvim
  alias ls="exa --icons --color auto -g"
  alias cd="z"
  alias tf="terraform"

  # Tmux configuration
  if tmux has-session 2>/dev/null
    tmux source-file ~/.tmux.conf
  end

  set -g fish_greeting ''

  alias ll="exa -l --icons --color auto"
  alias la="exa -la --icons --color auto"

  # Direnv + Zoxide
  # command -v direnv &> /dev/null && direnv hook fish | source
  command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

  # Abbrs
  abbr l 'ls'
  abbr ll 'ls -l'
  abbr la 'ls -a'
  abbr lla 'ls -la'

  # Custom colours
  # cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

  # For jumping between prompts in foot terminal
  function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
  end

  set -x WLR_NO_HARDWARE_CURSORS 1
  set -x WLR_RENDERER vulkan
  set -x __GL_THREADED_OPTIMIZATIONS 1
  set -x mesa_glthread true

  starship init fish | source
end
