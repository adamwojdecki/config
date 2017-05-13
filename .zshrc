export TERM="xterm-256color"
export ZSH=/home/adam/.oh-my-zsh

alias cdcas='cd ~/Development/Casumo-Engine'
alias subl='/opt/sublime_text/sublime_text'
alias gradle='~/Development/Casumo-Engine/gradlew'
alias m='sudo sshfs -o allow_other adamwojdecki@192.168.3.180:/Users/adamwojdecki/Desktop/ /mnt/mac/'
alias dev_tmux='tmuxp load adam'
alias v='vagrant ssh'
alias filebrowser='nautilus --browser .'
alias intellij_logs='tail -F /home/adam/Development/Casumo-Engine/jetty/logs/*'
alias nginx_start='sudo nginx -c `pwd`/sumo/generated/local_nginx.conf'
alias turn_off_monitors='xset dpms force off'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh
