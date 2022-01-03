##########################
# PATHS
##########################
# SBIN
export PATH="/usr/local/sbin:$PATH:/usr/local/bin/"

# PYTHON
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# RUBY
# eval "$(rbenv init -)"

# SPHINX
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

# FLUTTER
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="/usr/local/opt/flutter/bin:$PATH"
export FLUTTER_ROOT=$(asdf where flutter)

# FASTLANE
export PATH="$HOME/.fastlane/bin:$PATH"

# ANDROID
export PATH="/Users/dlani/Library/Android/sdk/tools:$PATH"

### HEROKU
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# USER BIN
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:${PATH}"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

. $(brew --prefix asdf)/libexec/asdf.sh

# YARN
export PATH="$PATH:$(yarn global bin)"
export PATH=~/.composer/vendor/bin:$PATH

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export INTEL_HAXM_HOME="/usr/local/Caskroom/intel-haxm"
export ANDROID_SDK_ROOT="/Users/dlani/Library/Android/sdk"
export ANDROID_HOME="/Users/dlani/Library/Android/sdk"
export PATH="${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
export PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin"

# Sources
for f in ~/.dotfiles/custom_segments/*; do source $f; done

# source ~/.powerlevel9krc
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic" # "braun", "juanghurtado", "wedisagree", "sonicradish", "fletcherm", "darkblood"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git git-extras ruby themes colorize
  gem docker docker-compose cp
  brew aws yarn
  history-search-multi-word zsh-autosuggestions
  zsh-syntax-highlighting git-prune
  alias-tips conda-zsh-completion
)

# Completion git-extras
# source /private/tmp/git-extras/etc/git-extras-completion.zsh

source $ZSH/oh-my-zsh.sh

# Conda
autoload -U compinit && compinit
zstyle ':completion::complete:*' use-cache 1
zstyle ":conda_zsh_completion:*" use-groups true

# User configuration

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# export PATH="$HOME/.azk/bin:$PATH"

# tmux
export TERM="xterm-256color"
export EDITOR="vim"

# ~/.bashrc
func set_tmux_pane_title() {
  printf "\033]2;%s\033\\" "$*";
}

# Go Lang
export GOPATH=$HOME/.gocode
export GOBIN=$GOPATH/bin

# Sources
for f in ~/.dotfiles/sources/*; do source $f; done

# autoenv
# source $(brew --prefix autoenv)/activate.sh

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
ZSH_AUTOSUGGEST_STRATEGY='match_prev_cmd'

# JAVAHOME
export JAVA_HOME=$(/usr/libexec/java_home)

# fzf https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FD_OPTIONS="--follow --exlude .git --exclude --node_modules --exclude bower_components"
export FZF_DEFAULT_OPTS="--no-mouse --inline-info --height 100% --layout=reverse --preview='[[ \$(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file || (bat --style=numbers --color=always {} || coderay {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND='fd --type f --type d'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export BAT_PAGER="less -R"

# Autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GPG_TTY=$(tty)

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
fi

