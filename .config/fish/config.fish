if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

zoxide init --cmd cd fish | source

alias config '/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias vim 'nvim'

export PATH="$HOME/.local/bin:$PATH"
/Users/wesleyweisenberger/.local/bin/mise activate fish | source
