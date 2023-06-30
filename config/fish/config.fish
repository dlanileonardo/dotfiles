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

# alias vim="lvim"
alias cat="bat"

set -gx PATH $PATH "$HOME/.pub-cache/bin"
set -gx PATH $PATH "/usr/local/opt/flutter/bin"
set -gx FLUTTER_ROOT (asdf where flutter)
set -gx PATH $PATH "/Users/dlani/.cargo/bin"
set -gx PATH $PATH "/Users/dlani/.local/bin/"
set -gx PATH $PATH "/usr/local/sbin"
set -gx PATH "$HOME/bin" $PATH
set -gx GPG_TTY $(tty)
# set -gx USE_LIMA 1
# set -gx BAT_THEME "base16"
# set -gx LS_COLORS $(gdircolors ~/.dir_colors | grep -o "\'.*\'" | grep -o '[0-9a-z:=;*.]\+')

# set -gx LUA_PATH "/Users/dlani/.config/nvim/?.lua;/Users/dlani/.config/lvim/?.lua"

set -gx FLUTTER_ROOT (asdf where flutter)
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

source /usr/local/opt/asdf/libexec/asdf.fish

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

if type -q exa
  alias ll "exa -l -g --icons --group-directories-first"
  alias la "ll -a"
  alias lk "ll --grid"
end

function fish_greeting
  if test -z "$DISABLE_GREETING"
    neofetch --ascii ~/.config/neofetch/cyberdyne
  end
end

if status is-interactive
    # zellij setup --generate-auto-start fish | source
end

direnv hook fish | source

# git-town completions fish | source

fzf_configure_bindings --directory=\cf

# test -r ~/.dir_colors && eval $(/usr/local/Cellar/coreutils/9.1/libexec/gnubin/dircolors ~/.dir_colors -c)

# fish_vi_key_bindings normal

# starship init fish | source

# zoxide init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /usr/local/Caskroom/miniconda/base/bin/conda
#     eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# end
# <<< conda initialize <<<


# dstask _completions fish | source

# ng completion script | source

for f in ~/.dotfiles/sources/*
  cat "$f" | source
end

zoxide init fish | source

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
