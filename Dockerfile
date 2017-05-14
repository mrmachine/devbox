FROM alpine:edge

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update \
	&& apk upgrade \
	&& apk add \
		aws-cli@testing \
		aws-cli-doc@testing \
		aws-cli-zsh-completion@testing \
		bash \
		bash-completion \
		bash-doc \
		beets \
		build-base \
		certbot \
		coreutils \
		curl \
		curl-doc \
		docker \
		docker-doc \
		docker-vim \
		docker-zsh-completion \
		dockerize@testing \
		elasticsearch \
		elasticsearch-doc \
		findutils \
		git \
		git-doc \
		git-zsh-completion \
		gnupg \
		gnupg-doc \
		go \
		go-doc \
		grep \
		grep-doc \
		htop \
		htop-doc \
		nginx \
		nginx-doc \
		nginx-vim \
		nodejs-npm \
		p7zip \
		p7zip-doc \
		postgresql \
		postgresql-doc \
		pv \
		pv-doc \
		py-virtualenv \
		python2 \
		python2-dev \
		python2-doc \
		python3 \
		python3-dev \
		python3-doc \
		redis \
		rsync \
		rsync-doc \
		rsync-zsh-completion \
		sqlite \
		sqlite-doc \
		tig \
		tig-doc \
		tini \
		tmux \
		tmux-doc \
		tmux-zsh-completion \
		unrar \
		unrar-doc \
		vim \
		vim-doc \
		wget \
		wget-doc \
		xz \
		xz-doc \
		zsh \
		zsh-doc \
		# See: https://wiki.alpinelinux.org/wiki/How_to_get_regular_stuff_working
    && rm -rf /var/cache/apk/*

WORKDIR /devbox/opt/git-secret/
COPY opt/git-secret /devbox/opt/git-secret/
RUN make build
RUN PREFIX="/devbox" make install

ENV EDITOR="vim"
ENV PATH="/devbox/bin:$PATH"
ENV ZDOTDIR="/devbox/.zsh"

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["zsh", "--login"]

WORKDIR /devbox/
COPY . /devbox/
