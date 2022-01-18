export TERM="xterm-256color"
export ZSH=/home/adam/.oh-my-zsh

NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias gw='./gradlew'
alias bl='nohup /opt/blender/blender >/dev/null 2>&1 &'
alias m='sudo sshfs -o IdentityFile=/home/adam/.ssh/id_rsa -o allow_other adamwojdecki@192.168.3.20:/Users/adamwojdecki/Desktop/ /mnt/mac/'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias portainer='docker run -v "/var/run/docker.sock:/var/run/docker.sock" -d -p 9000:9000 portainer/portainer'
alias docker_stop_all_containers='docker stop $(docker ps -aq)'
alias docker_remove_all_containers='docker rm $(docker ps -aq)'
alias docker_remove_all_images='docker rmi $(docker images -q)'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

. ~/z.sh

