export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

export PATH="$PATH:$(yarn global bin)"
export PATH="$HOME/.ndenv/bin:$PATH"
# eval "$(ndenv init -)"
