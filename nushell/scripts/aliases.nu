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

alias cddsl = cd $"($env.HOME)/Documents/projects/devops/cicd/dsl"

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
