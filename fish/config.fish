if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

starship init fish | source

pfetch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aukaitirrell/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/aukaitirrell/Downloads/google-cloud-sdk/path.fish.inc'; end
