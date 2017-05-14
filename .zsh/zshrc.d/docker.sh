alias drm='docker rm -v $(docker ps -a -q -f status=created -f status=exited)'
alias drmi='docker rmi $(docker images -f "dangling=true" -q)'
alias drun='docker-compose run --rm --service-ports'
