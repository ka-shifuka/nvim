# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status is-interactive
#   ...
# end
function __fish_command_not_found_handler --on-event fish_command_not_found
/data/data/com.termux/files/usr/libexec/termux/command-not-found $argv[1]
end

# TODO: remove when https://github.com/termux/termux-app/pull/4417 gets released
status test-feature keyboard-protocols && set -U fish_features no-keyboard-protocols

set -g USER "ka-shifuka"
set -x MANPAGER 'nvim +Man!'

set -U fish_user_path $HOME/zig-linux-aarch64-0.14.0 $fish_user_path


alias py=python
alias vim=nvim
