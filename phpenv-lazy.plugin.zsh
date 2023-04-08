# Try to find pyenv, if it's not on the path
export PHPENV_ROOT="${PYENV_ROOT:=${HOME}/.phpenv}"
if ! type phpenv > /dev/null && [ -f "${PHPENV_ROOT}/bin/phpenv" ]; then
    export PATH="${PHPENV_ROOT}/bin:${PATH}"
fi

# Lazy load phpenv
if type phpenv > /dev/null; then
    export PATH="${PHPENV_ROOT}/bin:${PHPENV_ROOT}/shims:${PATH}"
    function phpenv() {
        unset -f phpenv
        eval "$(command phpenv init -)"
        phpenv $@
    }
fi
