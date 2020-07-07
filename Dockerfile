FROM dclong/jupyter-nodejs

COPY scripts/ /scripts/
RUN apt-get update \
    && curl -sSL http://www.legendu.net/media/github_release.py | python3 - cdr/code-server -k amd64.deb -o /tmp/code.deb \                                                                                             
    #&& curl -L https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    && code-server --install-extension formulahendry.terminal \
    && code-server --install-extension ms-python.python@2020.5.86806 \
    #&& curl -sSL https://github.com/microsoft/vscode-python/releases/download/2020.5.86806/ms-python-release.vsix -o /scripts/ms-python-release.vsix \
    #&& code-server --install-extension /scripts/ms-python-release.vsix \
    && code-server --install-extension njpwerner.autodocstring \
    && code-server --install-extension vscodevim.vim \
    && code-server --install-extension bungcip.better-toml \
    #&& code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.9.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && chmod -R 777 /root \
    && rm -rf /scripts/*.vsix /tmp/* /var/lib/apt/lists/* /var/tmp/*
COPY settings/ /config/data/User/
RUN chmod 777 -R /config/
ENV SHELL=/bin/bash
EXPOSE 8080
