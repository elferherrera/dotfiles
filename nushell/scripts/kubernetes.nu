def kgetall [namespace: string] {
  let resources = kubectl api-resources --verbs=list --namespaced -o name
    | grep -v "events.events.k8s.io"
    | grep -v "events"
    | lines
    | sort
    | uniq

  $resources | each {|r|
    let result = kubectl -n $namespace get --ignore-not-found $r -o yaml | from yaml
    if ($result != null) {
      print $"Resource: ($r)"
      $result.items | each {|item|
        print $"  kind: ($item.kind)"
        print $"  name: ($item.metadata.name)"
        print  "  status:"
        if ("status" in $item) {
          print $item.status
        }
      }
    }
  }
}

def kgetall_del_cmd [namespace: string] {
  let resources = kubectl api-resources --verbs=list --namespaced -o name
    | grep -v "events.events.k8s.io"
    | grep -v "events"
    | lines
    | sort
    | uniq

  let res = $resources | each {|r|
    let result = kubectl -n $namespace get --ignore-not-found $r -o yaml | from yaml
    if ($result != null) {
      print $"Resource: ($r)"
      $result.items | each {|item|
        print $"  kubectl delete ($r) -n ($namespace) ($item.metadata.name)"
      }
    }
  }
  print $"kubectl delete namespace ($namespace)"
}
