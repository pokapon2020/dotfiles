set fish_greeting

alias ll leaai

if status is-interactive
    # Commands to run in interactive sessions can go here
end

bass source ~/.profile
source ~/.asdf/asdf.fish
starship init fish | source

