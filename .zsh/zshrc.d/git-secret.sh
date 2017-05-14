if [[ ! -f /devbox/bin/git-secret ]]; then
	cd /devbox/opt/git-secret
	make build
	PREFIX="/devbox" make install
fi
