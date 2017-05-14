# Source Prezto defaults.
source ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogin

# Source `zlogin.d/*.zsh` scripts.
for filename in ${ZDOTDIR:-$HOME}/zlogin.d/*.zsh(N); do
	source $filename
done
