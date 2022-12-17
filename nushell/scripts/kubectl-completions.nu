def "nu-complete kubectl context" [] {
  ^kubectl config get-contexts --no-headers=true | lines | str replace "[*]" " " | split column -c " " | get column1
}

def "nu-complete kubectl namespace" [] {
  ^kubectl get namespace | lines | skip 1 | split column -c ' ' | get column1
}

export extern "kubectl config get-contexts" [] 

export extern "kubectl config use-context" [
  context?: string@"nu-complete kubectl context"   # name of the context to change
] 

export extern "kubectl get namespace" [] 

export extern "kubectl get pods" [
  -n: string@"nu-complete kubectl namespace"       # namespace to get pods
] 

export extern "kubectl get pod" [
  -n: string@"nu-complete kubectl namespace"       # namespace to get pods
] 
