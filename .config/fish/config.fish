set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

bass source ~/.cargo/env
bass source ~/.profile
source ~/.asdf/asdf.fish
starship init fish | source
