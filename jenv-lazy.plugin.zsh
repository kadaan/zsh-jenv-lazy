# Lazy load jenv
if type jenv &> /dev/null; then
  local JENV_SHIMS="${JENV_ROOT:-${HOME}/.jenv}/shims"
  export PATH="${JENV_SHIMS}:${PATH}"
  source $(which jenv)/../../libexec/completions/jenv.zsh
  function jenv() {
    unset -f jenv > /dev/null 2>&1
    [[ -s "${HOME}/.jenv/bin/jenv-init.sh" ]] && source "${HOME}/.jenv/bin/jenv-init.sh" && source "${HOME}/.jenv/commands/completion.sh"
    eval "$(command jenv init -)"
    jenv "$@"
  }
fi
