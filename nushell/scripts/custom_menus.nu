let alias_menu = {
    name: alias_menu
    only_buffer_difference: false
    marker: "👁️ "
    type: {
        layout: columnar
        columns: 1
        col_width: 20
        col_padding: 2
    }
    style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
    }
    source: { |buffer, position|
        scope aliases
        | where name == $buffer
        | each { |it| {value: $it.expansion }}
    }
}

let fzf_menu =  {
    name: fzf_menu
    only_buffer_difference: false
    marker: "# "
    type: {
        layout: columnar
        columns: 1
        col_width: 20
        col_padding: 2
    }
    style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
    }
    source: { |buffer, position|
        let input = (fzf --no-sort --tac --height=40% --layout=reverse --tiebreak=chunk  | lines)
        let start = ($buffer | str length) + 1
                
        $input
        | each { |v| 
            {
                value: ($v | str trim) 
                span: { start: $start end: $position }
            } 
        }
    }
}

let fzf_var_menu =  {
    name: fzf_var_menu
    only_buffer_difference: false
    marker: "# "
    type: {
        layout: columnar
        columns: 1
        col_width: 20
        col_padding: 2
    }
    style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
    }
    source: { |buffer, position|
        let env_vars = $env | columns | each {|var| $"\$env.($var)"}
        let vars = scope variables | get name | each {|var| $"($var)"}

        let input = (
          $env_vars 
          | append $vars
          | str join (char -i 0)
          | fzf --read0 --tiebreak=chunk --layout=reverse --multi --height=40% 
          | decode utf-8
          | str trim
          | lines
        )
        let start = ($buffer | str length) + 1
                
        $input
        | each { |v| 
            {
                value: ($v | str trim) 
                span: { start: $start end: $position }
            } 
        }
    }
}
