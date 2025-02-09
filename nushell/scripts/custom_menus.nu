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
        let input = (fzf --no-sort --tac --height=40% --layout=reverse --tiebreak=chunk | lines)
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
          | fzf
              --read0
              --tiebreak=chunk
              --layout=reverse
              --multi
              --height=40%
              --preview-window='right:90:wrap'
              --preview='try {
                  $env | get ({..} | str replace "$env." "")
                } catch {
                  {..}
                }'
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

let fzf_carapace_menu =  {
    name: fzf_carapace_menu
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
        let spans = $buffer | split row " "
        let data = carapace $spans.0 nushell ...$spans | from json


        let input = (
          $data
          | each {|r|
              let value = $r.value | str trim
              if "description" in $r {
                  $value + "\t" + ($r.description | str replace ":" "")
              } else {
                  $value + "\t" + ""
              }
          }
          | str join (char -i 0)
          | fzf
              --read0
              --tiebreak=chunk
              --layout=reverse
              --delimiter "\t"
              --with-nth=1
              --bind 'enter:become(echo {1})'
              --color "hl:-1:underline,hl+:-1:underline:reverse"
              --preview '{2} | bat'
              --height=40%
          | decode utf-8
          | str trim
          | lines
        )

        let words = $buffer | split column --regex '\s* \s*' | values | each {|v| $v.0}
        let last_word = $words | last
        let start = if ($input.0 | str starts-with $last_word) {
            let elem = ($words | length) - 1
            let len = $words | first $elem | reduce --fold 0 {|it, acc| $acc + ($it | str length)}
            $len + $elem
        } else {
            ($buffer | str length) + 1
        }

        {
            value: ($input.0 | str trim)
            span: { start: $start end: $position }
        }
    }
}
