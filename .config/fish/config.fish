set fish_greeting
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#function fish_user_key_bindings
#  fish_vi_key_bindings insert
#end

bass source ~/.cargo/env
bass source ~/.profile
source ~/.asdf/asdf.fish
starship init fish | source
