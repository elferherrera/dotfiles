alias cdn = enter ($nu.config-path | path dirname)
alias cdv = cd $"($env.HOME)/.config/nvim"

alias cddp = cd $"($env.HOME)/Documents/playground"
alias cddd = cd $"($env.HOME)/Documents/projects/devops"
alias cdda = cd $"($env.HOME)/Documents/projects/data"

alias k = kubectl
alias kcg = kubectl config get-contexts
alias kcu = kubectl config use-context
alias kgp = kubectl get pods

alias gc = git checkout
alias gs = git status
alias gf = git fetch
alias gp = git pull origin master --no-rebase
alias gb = git branch

alias lzp = DOCKER_HOST=$"unix:///($env.HOME)/.local/share/containers/podman/machine/qemu/podman.sock" lazydocker
#alias docker = podman
#alias docker-compose = podman-compose

alias lg = lazygit
