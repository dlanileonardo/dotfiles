if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_key_bindings fish_default_key_bindings

    set -g theme_display_ruby yes
    set -g theme_color_scheme dark
    set -g theme_nerd_fonts yes
    set -g theme_powerline_fonts yes
    set -g theme_date_timezone America/Sao_Paulo

    set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
    set -gx PROJECT_PATHS /Volumes/Workspace/
    set --universal tide_right_prompt_items status cmd_duration context jobs vi_mode virtual_env time

    set -g theme_display_virtualenv no
    set -g theme_display_ruby no
    set -g theme_title_use_abbreviated_path no
    set -g theme_project_dir_length 1

    set -g fish_prompt_pwd_dir_length 0
end

alias vim="nvim"

fish_add_path -a "/home/linuxbrew/.linuxbrew/bin"
fish_add_path -a "$HOME/.pub-cache/bin"
fish_add_path -a /usr/local/opt/flutter/bin
fish_add_path -a "/Users/dlani/.cargo/bin"
fish_add_path -a "$HOME/.local/bin/"
fish_add_path -a /usr/local/sbin
fish_add_path -a "$HOME/bin"
fish_add_path -a "/home/linuxbrew/.linuxbrew/sbin"
fish_add_path -a "$HOME/.local/share/nvim/mason/bin"
fish_add_path -a "$HOME/.asdf/shims/"

set -gx GPG_TTY $(tty)
set -gx EDITOR vim
set -gx HOMEBREW_NO_ENV_HINTS 1

set -gx FORGIT_PAGER 'delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}'

# done
set -U __done_enabled 1
set -U __done_initial_window_id com.googlecode.iterm2
set -U __done_notification_command "terminal-notifier -sender com.googlecode.iterm2 -title \$title -message \$message"
set -U __done_min_cmd_duration 5000
set -U __done_notify_sound 1
# done

alias work="cd /Volumes/Workspace/"
alias mux="tmuxinator"
alias top="htop"
alias meuip="curl https://ipinfo.io/ip"
alias workspace="cd /Volumes/Workspace"
alias work="cd /Volumes/Workspace"
alias serve="browser-sync start -s -f . --no-notify --host 0.0.0.0 --port 9000"
alias colortest="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash"
alias zev="zellij --layout dev"

if type -q eza
    alias ll "eza -l -g --icons --group-directories-first"
    alias la "ll -a"
    alias lk "ll --grid"
end

function fish_greeting
    if test -z "$DISABLE_GREETING"
        # neofetch --ascii ~/.config/neofetch/cyberdyne
        neofetch
    end
end

if status is-interactive
    # zellij setup --generate-auto-start fish | source
end

set DIRENV_CONFIG $XDG_CONFIG_HOME/direnv/direnv.toml

if type -q direnv
    direnv hook fish | source
end

if type -q zoxide
    zoxide init fish | source
end

for f in ~/.dotfiles/sources/*
    cat "$f" | source
end

if type -q ngrok
    eval "$(ngrok completion)"
end

if type -q shadowenv
    shadowenv init fish | source
end

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

if test -d (brew --prefix)"/share/fish/completions"
    source (brew --prefix)/opt/asdf/libexec/asdf.fish
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /usr/local/Caskroom/miniconda/base/bin/conda
    eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<
