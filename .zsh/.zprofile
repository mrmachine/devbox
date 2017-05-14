# Source Prezto defaults.
source ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zprofile

# Source `zprofile.d/*.zsh` scripts.
for filename in ${ZDOTDIR:-$HOME}/zprofile.d/*.zsh(N); do
	source $filename
done
