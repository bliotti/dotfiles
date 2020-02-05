time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else 
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

echo "Updating configuration"
#(cd ~/dotfiles && time_out 3 git pull && time_out 3 git submodule update --init --recursive)
(cd ~/dotfiles && git pull && git submodule update --init --recursive)
source ~/dotfiles/zsh/zshrc.sh
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/Users/brianliottiair/Library/Python/3.7/bin:$PATH"

alias "l"='ls -lah'
alias "cl"="clear"
alias "code"="code-insiders"

# TRICKS
#
# Pretty Print $PATH
#   echo $PATH | tr -s ':' '\n'
