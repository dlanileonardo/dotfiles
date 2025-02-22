# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end

set --erase _asdf_shims
alias vim="nvim"
alias cat="bat"

alias work="cd /Volumes/Workspace/"
alias mux="tmuxinator"
alias top="htop"
alias meuip="curl https://ipinfo.io/ip"
alias workspace="cd /Volumes/Workspace"
alias work="cd /Volumes/Workspace"
alias serve="browser-sync start -s -f . --no-notify --host 0.0.0.0 --port 9000"
alias colortest="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash"
alias zev="zellij --layout dev"
# alias lazydocker="DOCKER_HOST=ssh://ubuntu /usr/local/bin/lazydocker"
# alias docker="lima nerdctl"
# alias task="dstask"

set -gx PATH $PATH "$HOME/.pub-cache/bin"
set -gx PATH $PATH /usr/local/opt/flutter/bin
set -gx PATH $PATH "/Users/dlani/.cargo/bin"
set -gx PATH $PATH "/Users/dlani/.local/bin/"
set -gx PATH $PATH /opt/local/bin
set -gx PATH $PATH /opt/local/sbin
set -gx PATH "$HOME/bin" $PATH
set -gx GPG_TTY $(tty)

# pnpm
set -gx PNPM_HOME /Users/dlani/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# set -gx USE_LIMA 1
# set -gx BAT_THEME "base16"
# set -gx LS_COLORS $(gdircolors ~/.dir_colors | grep -o "\'.*\'" | grep -o '[0-9a-z:=;*.]\+')
# set -gx LUA_PATH "/Users/dlani/.config/nvim/?.lua;/Users/dlani/.config/lvim/?.lua"

set -gx FLUTTER_ROOT (asdf where flutter)
set -gx EDITOR vim
set -gx HOMEBREW_NO_ENV_HINTS 1

set -gx FORGIT_PAGER 'delta --side-by-side -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}'

# done
set -U __done_enabled 1
set -U __done_initial_window_id com.googlecode.iterm2
set -U __done_notification_command "terminal-notifier -sender com.googlecode.iterm2 -title \$title -message \$message"
set -U __done_min_cmd_duration 5000
set -U __done_notify_sound 1
# done end

fzf_configure_bindings --directory=\cf

if test -d (brew --prefix)"/Homebrew/bin/brew"
    /usr/local/Homebrew/bin/brew shellenv | source
end

if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

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


if type -q eza
    alias ll "eza -l -g --icons --group-directories-first --tree --level=1"
    alias la "ll -a"
    alias lk "ll --grid"
end

function __fish_complete_aws
    env COMP_LINE=(commandline -pc) aws_completer | tr -d ' '
end

complete -c aws -f -a "(__fish_complete_aws)"

function fish_greeting
    if test -z "$DISABLE_GREETING"
        neofetch --ascii ~/.config/neofetch/cyberdyne
    end
end

if status is-interactive
    if type -q zellij
        zellij setup --generate-auto-start fish | source
    end
end


if type -q git-town
    git-town completions fish | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /usr/local/Caskroom/miniconda/base/bin/conda
#     eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
# end
# <<< conda initialize <<<

if type -q direnv
    direnv hook fish | source
end

if type -q starship
    starship init fish | source
end

if type -q dstask
    dstask _completions fish | source
end

if type -q ng
    # ng completion script | source
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
