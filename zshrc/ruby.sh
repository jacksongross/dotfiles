export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DISABLE_SPRING=true
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/:$(brew --prefix openssl)/lib/

alias be="bundle exec"

eval "$(rbenv init - zsh)"
eval "$(direnv hook zsh)"
