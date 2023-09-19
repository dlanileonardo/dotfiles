# source ~/.asdf/asdf.fish
source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish

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

alias vim="lvim"
# alias cat="batcat"

fish_add_path -a "/home/linuxbrew/.linuxbrew/bin"
fish_add_path -a "$HOME/.pub-cache/bin"
fish_add_path -a "/usr/local/opt/flutter/bin"
fish_add_path -a "/Users/dlani/.cargo/bin"
fish_add_path -a "$HOME/.local/bin/"
fish_add_path -a "/usr/local/sbin"
fish_add_path -a "$HOME/bin"
fish_add_path -a "/home/linuxbrew/.linuxbrew/sbin"

# set -gx USE_LIMA 1
# set -gx BAT_THEME "base16"
# set -gx LS_COLORS $(gdircolors ~/.dir_colors | grep -o "\'.*\'" | grep -o '[0-9a-z:=;*.]\+')
# set -gx LUA_PATH "/Users/dlani/.config/nvim/?.lua;/Users/dlani/.config/lvim/?.lua"

set -gx GPG_TTY $(tty)
# set -gx FLUTTER_ROOT (asdf where flutter)
set -gx EDITOR "vim"
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
# alias docker="lima nerdctl"
# alias task="dstask"

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


# git-town completions fish | source

# fzf_configure_bindings --directory=\cf

# test -r ~/.dir_colors && eval $(/usr/local/Cellar/coreutils/9.1/libexec/gnubin/dircolors ~/.dir_colors -c)

# fish_vi_key_bindings normal


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /usr/local/Caskroom/miniconda/base/bin/conda
#     eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# end
# <<< conda initialize <<<

set DIRENV_CONFIG $XDG_CONFIG_HOME/direnv/direnv.toml
direnv hook fish | source
# starship init fish | source
# dstask _completions fish | source
# ng completion script | source
zoxide init fish | source

for f in ~/.dotfiles/sources/*
  cat "$f" | source
end

# if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
# fi

# function cd -w='cd'
#   builtin cd $argv || return
#   check_directory_for_new_repository
# end

# function check_directory_for_new_repository
#   set current_repository (git rev-parse --show-toplevel 2> /dev/null)
#   if [ "$current_repository" ] && \
#     [ "$current_repository" != "$last_repository" ]
#     onefetch
#   end
#   set -gx last_repository $current_repository
# end

# funcsave cd
# funcsave check_directory_for_new_repository
shadowenv init fish | source

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
