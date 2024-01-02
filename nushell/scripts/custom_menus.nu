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
        let input = (fzf --no-sort --tac  | lines)
        let start = ($buffer | str index-of ' ') + 1
                
        $input
        | each { |v| 
            {
                value: ($v | str trim) 
                span: { start: $start end: $position }
            } 
        }
    }
}
