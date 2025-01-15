if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

starship init fish | source

pfetch


pyenv init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aukaitirrell/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/aukaitirrell/Downloads/google-cloud-sdk/path.fish.inc'; end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
export VOLTA_FEATURE_PNPM=1
