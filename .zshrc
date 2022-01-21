alias gw='./gradlew'
alias bl='nohup /opt/blender/blender >/dev/null 2>&1 &'
alias m='sudo sshfs -o IdentityFile=/home/adam/.ssh/id_rsa -o allow_other adamwojdecki@192.168.3.20:/Users/adamwojdecki/Desktop/ /mnt/mac/'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias portainer='docker run -v "/var/run/docker.sock:/var/run/docker.sock" -d -p 9000:9000 portainer/portainer'
alias docker_stop_all_containers='docker stop $(docker ps -aq)'
alias docker_remove_all_containers='docker rm $(docker ps -aq)'
alias docker_remove_all_images='docker rmi $(docker images -q)'

TIMER_FORMAT='[%d]'
TIMER_PRECISION=2
TIMER_THRESHOLD=0.1
