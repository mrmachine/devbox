export PYENV_ROOT="/devbox/opt/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

ln -fs /devbox/opt/pyenv-virtualenv "$PYENV_ROOT/plugins/pyenv-virtualenv"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
