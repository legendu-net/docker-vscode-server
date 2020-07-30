# NAME: dclong/vscode-server
FROM dclong/jupyter-nodejs
# GIT: https://github.com/dclong/docker-jupyter-nodejs.git

COPY scripts/ /scripts/
RUN pip3 install git+https://github.com/dclong/dsutil@master
RUN apt-get update \
    && curl -sSL http://www.legendu.net/media/github_release.py | python3 - cdr/code-server -k amd64.deb -o /tmp/code.deb \                                                                                             
    #&& curl -L https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    && code-server --install-extension formulahendry.terminal \
    && code-server --install-extension ms-python.python@2020.5.86806 \
    && code-server --install-extension njpwerner.autodocstring \
    && code-server --install-extension vscodevim.vim \
    && code-server --install-extension bungcip.better-toml \
    #&& code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.9.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && xinstall vscode -c --dst-dir /config/data/User/ \
    && chmod -R 777 /root \
    && rm -rf /scripts/*.vsix /tmp/* /var/lib/apt/lists/* /var/tmp/*
RUN chmod 777 -R /config/
ENV SHELL=/bin/bash
EXPOSE 8080
