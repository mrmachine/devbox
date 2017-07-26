FROM buildpack-deps:xenial

RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y --no-install-recommends \
        # bash-doc \
        # beets-doc \
        # certbot \
        # git-doc \
        # git-lfs \
        # gnupg-doc \
        # golang-doc \
        # nginx-doc \
        # nodejs \
        # postgresql-doc \
        # pyenv \
        # pyenv-virtualenv \
        # python-doc \
        # python3-doc \
        # rclone \
        # sqlite-doc \
        # vim-doc \
        # zsh-doc \
        apache2-utils \
        apt-utils \
        awscli \
        bash-completion \
        beets \
        bsdmainutils \
        elasticsearch \
        gnupg \
        golang \
        htop \
        jq \
        locales \
        nano \
        nginx \
        p7zip \
        postgresql \
        postgresql-client \
        pv \
        python \
        python-dev \
        python-virtualenv \
        python3 \
        python3-dev \
        redis-server \
        rsync \
        sqlite \
        tig \
        tmate \
        tmux \
        unrar-free \
        vim \
        vim-editorconfig \
        vim-python-jedi \
        vim-syntax-docker \
        zsh \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

ENV DOCKERIZE_VERSION=0.4.0
RUN wget -nv -O - "https://github.com/jwilder/dockerize/releases/download/v${DOCKERIZE_VERSION}/dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz" | tar -xz -C /usr/local/bin/ -f -

ENV NODE_VERSION=4.4.2
ENV PATH="/opt/node-v${NODE_VERSION}-linux-x64/bin:$PATH"
RUN wget -nv -O - "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" | tar -Jx -C /opt/ -f -

ENV PYTHON_PIP_VERSION=9.0.1
RUN wget -nv -O - https://bootstrap.pypa.io/get-pip.py | python - "pip==${PYTHON_PIP_VERSION}"

ENV TINI_VERSION=0.14.0
RUN wget -nv -O /usr/local/bin/tini "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static"
RUN chmod +x /usr/local/bin/tini

# https://github.com/git-lfs/git-lfs/releases/download/v2.1.0/git-lfs-linux-amd64-2.1.0.tar.gz

ENV EDITOR="vim"
ENV PATH="/devbox/bin:$PATH"
ENV ZDOTDIR="/devbox/.zsh"

ENTRYPOINT ["tini", "--", "entrypoint.sh"]
CMD ["sleep", "infinity"]

WORKDIR /devbox/
COPY . /devbox/
