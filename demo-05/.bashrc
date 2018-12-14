source "${HOME}/lib/path.sh"

export PS1="[\u@${DISTRO} \W]$ "

unalias -a

alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'
alias tmux='tmux -2'

tree() {
  local -r ignore_dirs='.git|node_modules'
  "$(which tree)" -a --charset ascii -I "${ignore_dirs}" -n "$@"
}

export -f tree

prepend_to_path "${HOME}/bin"
