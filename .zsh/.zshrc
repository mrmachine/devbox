# Source Prezto defaults.
source ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc

# Source `zshrc.d/*.zsh` scripts.
for filename in ${ZDOTDIR:-$HOME}/zshrc.d/*.zsh(N); do
	source $filename
done
