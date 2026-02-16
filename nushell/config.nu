# Environment variables
$env.config.buffer_editor = "nvim"

const third_party = ($nu.default-config-dir | path join "third_party")
const git_completions_path = ($third_party | path join "nu_scripts/custom-completions/git/git-completions.nu")
source $git_completions_path
