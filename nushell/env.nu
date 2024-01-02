# Nushell Environment Config File

$env.PATH = [
  "/bin"
  "/sbin"
  "/usr/bin"
  "/usr/sbin"
  "/usr/local/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  $"($env.HOME)/.cargo/bin"
  $"($env.HOME)/.local/bin"
  $"($env.HOME)/.cabal/bin"
  $"($env.HOME)/.ghcup/bin"
  $"($env.HOME)/.pyenv/bin"
  $"($env.HOME)/.kube/plugins/jordanwilson230"
  $"($env.HOME)/bin/google-cloud-sdk/bin"
]

# Homebrew configuration for MacOS
# envs set by /opt/homebrew/bin shellenv
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"
$env.MANPATH = "/opt/homebrew/share/man"
$env.INFOPATH = "/opt/homebrew/share/info"

$env.PYENV_ROOT = $'($env.HOME)/.pyenv'

def create_left_prompt [] {
  starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

$env.USE_GKE_GCLOUD_AUTH_PLUGIN = {|| "True" }

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| "" }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "〉" }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "〉" }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str join (char esep) }
  }
  "HADOOP_CLASSPATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str join (char esep) }
  }
  "PYTHONPATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

$env.EDITOR = "/opt/homebrew/bin/nvim"

$env.DOCKER_HOST = $"unix:///($env.HOME)/.local/share/containers/podman/machine/qemu/podman.sock"
