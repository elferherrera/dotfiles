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
    keycode: char_p
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
    keycode: char_u
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
    keycode: char_y
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
    name: fzf_menu
    modifier: control
    keycode: char_k
    mode: [vi_normal, vi_insert]
    event: { send: menu name: fzf_menu}
  }  
  {
    name: todo_list
    modifier: control
    keycode: char_j
    mode: [vi_normal, vi_insert]
    event: [ 
      { send: ExecuteHostCommand cmd: "vim ~/Documents/todo.txt" }
    ]
  }  
]
