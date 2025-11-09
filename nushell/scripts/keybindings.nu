let my_keybindings =  [
  {
    name: completion_menu
    modifier: none
    keycode: tab
    mode: [vi_normal vi_insert]
    event: {
      until: [
        { send: menu name: completion_menu }
        { send: menunext }
      ]
    }
  }
  {
    name: completion_previous
    modifier: shift
    keycode: backtab
    mode: [vi_normal vi_insert] # Note: You can add the same keybinding to all modes by using a list
    event: { send: menuprevious }
  }
  {
    name: history_menu
    modifier: control
    keycode: char_u
    mode: [vi_normal vi_insert]
    event: {
      until: [
        { send: menu name: history_menu }
        { send: menupagenext }
      ]
    }
  }
  {
    name: history_previous
    modifier: control
    keycode: char_z
    mode: [vi_normal vi_insert]
    event: {
      until: [
        { send: menupageprevious }
        { edit: undo }
      ]
    }
  }
  {
    name: help_menu
    modifier: control
    keycode: char_p
    mode: [vi_normal vi_insert]
    event: { send: menu name: help_menu }
  }
  {
    name: partial_complete
    modifier: shift
    keycode: right
    mode: [vi_normal vi_insert] # Note: You can add the same keybinding to all modes by using a list
    event: { send: HistoryHintWordComplete }
  }
  {
    name: alias_menu
    modifier: control
    keycode: char_b
    mode: [vi_normal, vi_insert]
    event: { send: menu name: alias_menu }
  }
  {
    name: reload_config
    modifier: control
    keycode: char_t
    mode: [vi_normal, vi_insert]
    event: [
      { send: ExecuteHostCommand cmd: $"source '($nu.env-path)'; source '($nu.config-path)'" }
    ]
  }
  {
    name: todo_list
    modifier: control
    keycode: char_m
    mode: [vi_normal, vi_insert]
    event: [
      { send: ExecuteHostCommand cmd: "nvim ~/Documents/todo.txt" }
    ]
  }
  {
    name: fzf_menu
    modifier: control
    keycode: char_k
    mode: [vi_normal, vi_insert]
    event: { send: menu name: fzf_menu}
  }
  {
    name: fuzzy_history_fzf
    modifier: control
    keycode: char_l
    mode: [vi_normal, vi_insert]
    event: {
      send: ExecuteHostCommand
      cmd: "commandline edit --replace (
        history
        | where exit_status == 0
        | get command
        | uniq
        | reverse
        | str join (char -i 0)
        | fzf --scheme=history --read0 --tiebreak=chunk --layout=reverse --preview='echo {..}' --preview-window='bottom:3:wrap' --bind alt-up:preview-up,alt-down:preview-down --height=70% -q (commandline) --preview='echo {} | nu --stdin -c \'nu-highlight\''
        | decode utf-8
        | str trim
      )"
    }
  }
  {
    name: fzf_var_menu
    modifier: control
    keycode: char_j
    mode: [vi_normal, vi_insert]
    event: { send: menu name: fzf_var_menu}
  }
  {
    name: fzf_carapace_menu
    modifier: control
    keycode: char_h
    mode: [vi_normal, vi_insert]
    event: { send: menu name: fzf_carapace_menu }
  }
]
