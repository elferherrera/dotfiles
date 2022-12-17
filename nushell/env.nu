# Nushell Environment Config File

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
let-env PATH = (
  echo $env.PATH
  | split row (char esep)
  | prepend '/bin'
  | prepend '/sbin'
  | prepend '/usr/bin'
  | prepend '/usr/sbin'
  | prepend '/usr/local/bin'
  | prepend $'($env.HOME)/bin/google-cloud-sdk/bin'
  | prepend $'($env.HOME)/.cargo/bin'
  | prepend $'($env.HOME)/go/bin'
  | prepend $'($env.HOME)/bin/go/bin'
  | prepend $'($env.HOME)/bin/trino'
  | prepend $'($env.HOME)/bin/hadoop-3.3.3/bin'
  | prepend $'($env.HOME)/bin/apache-hive-3.1.3-bin/bin'
  | prepend $'($env.HOME)/.kube/plugins/jordanwilson230'
  | prepend $'($env.HOME)/Library/Application Support/Coursier/bin'
)

def create_left_prompt [] {
  starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { "" }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "HADOOP_CLASSPATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]
