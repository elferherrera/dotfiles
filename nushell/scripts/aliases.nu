alias nv = nvim

alias con = nvim ($nu.config-path | path dirname)
alias cov = nvim $"($env.HOME)/.config/nvim"
alias coz = nvim $"($env.HOME)/.config/zellij/config.kdl"
alias cok = nvim $"($env.HOME)/Library/Application Support/k9s/config.yaml"

alias cddpr = cd $"($env.HOME)/Documents/projects"
alias cddpu = cd $"($env.HOME)/Documents/mental_puke"
alias cddpl = cd $"($env.HOME)/Documents/playground"
alias cdds = cd $"($env.HOME)/Documents/projects/secrets"
alias cddk = cd $"($env.HOME)/Documents/projects/kubectl"

alias cddda = cd $"($env.HOME)/Documents/projects/data"
alias cddde  = cd $"($env.HOME)/Documents/projects/devops"

alias cddi = cd $"($env.HOME)/Documents/projects/devops/infra"
alias cdda = cd $"($env.HOME)/Documents/projects/devops/infra/ansible"

alias cddc  = cd $"($env.HOME)/Documents/projects/devops/cicd"
alias cddr  = cd $"($env.HOME)/Documents/projects/devops/cicd/rhea"
alias cddrr = cd $"($env.HOME)/Documents/projects/devops/cicd/rhea_repos"

alias cddsl = cd $"($env.HOME)/Documents/projects/devops/cicd/dsl/infra-dsl-transpiler"

alias k = kubectl
alias kcg = kubectl config get-contexts
alias kcu = kubectl config use-context
alias kgp = kubectl get pods

alias gcm = git checkout master
alias gc = git checkout
alias gs = git status
alias gf = git fetch
alias gp = git pull origin master --no-rebase
alias gb = git branch

alias lzg = lazygit
alias lzd = lazydocker

alias gcca = gcloud config configurations activate
alias gccl = gcloud config configurations list

alias fnv = nvim (fzf --multi --layout=reverse --height=40% --preview 'bat --style=numbers --color=always --line-range :500 {}')

def frg [] {
  let RG_PREFIX = "rg --column --line-number --no-heading --color=always --smart-case "
  let PROMP_FZF = "2. fzf> "
  let BIND_FZF = (
    "ctrl-f:unbind(change,ctrl-f)"
    + "+change-prompt(" + $PROMP_FZF + ")"
    + "+enable-search"
    + "+rebind(ctrl-r)"
    + "+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)"
  )

  let PROMP_RG = "1. ripgrep> "
  let BIND_RG = (
    "ctrl-r:unbind(ctrl-r)"
    + "+change-prompt(" + $PROMP_RG + ")"
    + "+disable-search"
    + "+reload(" + $RG_PREFIX + "{q})"
    + "+rebind(change,ctrl-f)"
    + "+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)"
  )

  (fzf
    --ansi --disabled --query ""
    --bind $"start:reload:($RG_PREFIX) {q}"
    --bind $"change:reload:sleep 0.1sec; ($RG_PREFIX) {q}"
    --bind $BIND_FZF
    --bind $BIND_RG
    --bind 'enter:become(nvim {1} +{2})'
    --delimiter :
    --prompt $PROMP_RG
    --color "hl:-1:underline,hl+:-1:underline:reverse"
    --header '╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱'
    --preview 'bat --color=always {1} --highlight-line {2}'
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
  )
}

def --env yy [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

def nufzf [] {
  $in | each {|i| $i | to json --raw} | str join (char -i 0) | fzf --read0 --preview-window=hidden | from json
}

def fpods [] {
  let command = "kubectl get pods --all-namespaces"

  (fzf
    --info=inline --layout=reverse --header-lines=1
    --prompt $"(kubectl config current-context | sed 's/-context$//')> "
    --header "╱ Enter (kubectl exec) ╱ CTRL-O (open log in editor) ╱ CTRL-R (reload) ╱n\n"
    --bind $"start:reload:($command)"
    --bind $"ctrl-r:reload:($command)"
    --bind "ctrl-o:execute:${EDITOR:-vim} <(kubectl logs --all-containers --namespace {1} {2})"
    --bind "ctrl-/:change-preview-window(80%,border-bottom|hidden|)"
    --bind "enter:execute:kubectl exec -it --namespace {1} {2} -- /bin/bash"
    --preview-window up:follow
    --preview 'kubectl logs --follow --all-containers --tail=10000 --namespace {1} {2}'
  )
}
