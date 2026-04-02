$env.config.buffer_editor = "nvim"

# edit
$env.config.edit_mode = "vi"
$env.config.keybindings ++= [ {
    name: "ctrl-[ escape"
    modifier: Control 
    keycode: Char_u00005b
    mode: [Vi_Insert]
    event: {
        send: ViChangeMode
        mode: normal # This is case senstive, see https://github.com/nushell/reedline/pull/932
    }
} ]
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"

# color
$env.config.color_config.bool = "cyan"
$env.config.color_config.shape_bool = "cyan"
$env.config.color_config.shape_external_resolved = "yellow_bold"
$env.config.color_config.shape_nothing = "cyan"
$env.config.color_config.shape_raw_string = "purple"

$env.LS_COLORS = (vivid generate one-light-refined)

# misc
$env.config.rm.always_trash = true
$env.config.show_banner = false

const third_party = ($nu.default-config-dir | path join "third_party")
const git_completions_path = ($third_party | path join "nu_scripts/custom-completions/git/git-completions.nu")
source $git_completions_path


alias la = ls -a
alias ll = ls -l
alias g = git
alias lg = lazygit
alias re = recnys
