# Source Prezto defaults.
source ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshenv

# Source `zshenv.d/*.zsh` scripts.
for filename in ${ZDOTDIR:-$HOME}/zshenv.d/*.zsh(N); do
	source $filename
done
