export def-env my-env [] { 
    let values = (
        open .env 
        | lines 
        | parse "{key}={value}"
        | reduce -f {} {|it, acc| $acc | upsert $it.key $it.value}
    )
    
    load-env $values
}
