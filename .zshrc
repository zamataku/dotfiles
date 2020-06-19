source ~/.zplug/init.zsh

# kubernetes related
export KUBECONFIG=${HOME}/.kube/config
source <(kubectl completion zsh)
alias k='kubectl'
alias kubens='kubectl config set-context $(kubectl config current-context) --namespace'

GOPATH=$HOME/go
export GOPATH
export PATH=$GOPATH/bin:$PATH

alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias commit='git commit -a -m'
alias push='git push origin'
alias pull='git pull origin'

# pure
fpath+=$HOME/.zsh/pure
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
KUBE_PS1_PREFIX=
KUBE_PS1_SEPARATOR=
KUBE_PS1_SUFFIX=
autoload -U promptinit; promptinit
prompt pure
PROMPT='$(kube_ps1)%(?.%F{magenta}❯.%F{red}❮)%f '

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# autsuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# history configuration
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history

# history completion
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

export PATH="/usr/local/bin:$PATH"
