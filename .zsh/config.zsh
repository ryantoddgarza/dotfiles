# profiling
zmodload zsh/zprof

# lazy load nvm FIXME
# NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 4 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
# NODE_GLOBALS+=(node nvm)

# load_nvm () {
#   [[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"
# }

# for cmd in "${NODE_GLOBALS[@]}"; do
#   eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@; }"
# done

# always load nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"
