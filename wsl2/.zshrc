export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

bindkey '^[[Z' autosuggest-accept

# proxy
host_ip=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
proxy_url="http://$host_ip:7890"

npm config set proxy $proxy_url
npm config set https-proxy $proxy_url

pnpm config set proxy $proxy_url
pnpm config set https-proxy $proxy_url

git config --global http.proxy $proxy_url
git config --global https.proxy $proxy_url

function px1() {
  export http_proxy=$proxy_url
  export https_proxy=$proxy_url
  export no_proxy="$host_ip,localhost"
	export all_proxy=$proxy_url
  export HTTP_PROXY=$proxy_url
  export HTTPS_PROXY=$proxy_url
  export NO_PROXY="$host_ip,localhost"
	export ALL_PROXY=$proxy_url
  echo -e "\033[32m[√] Proxy on\033[0m"
}

function px0(){
  unset http_proxy
  unset https_proxy
  unset no_proxy
  unset all_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset NO_PROXY
  unset ALL_PROXY
  echo -e "\033[31m[×] Proxy off\033[0m"
}

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias c="clear"
alias ga="git add"
alias gc="git commit -m"
alias gac="git add . && git commit -m"
alias gamend="git commit --amend --no-edit"
alias gamendm="git commit --amend -m"
alias grl="git reflog"
alias gl="git log"
alias gps="git push origin"
alias gpl="git pull origin"
alias grc="git rebase --continue"
alias gs="git status"
alias gco="git checkout"
alias gm="git merge"
alias gb="git branch"
alias gf="git fetch"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
