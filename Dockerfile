# NAME: dclong/vscode-server
FROM dclong/jupyterhub-more
# GIT: https://github.com/dclong/docker-jupyterhub-more.git

COPY scripts/ /scripts/
RUN pip3 install git+https://github.com/dclong/dsutil@main
RUN apt-get update \
    && xinstall github -r cdr/code-server -v "<3.8.0" -k amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    && code-server --install-extension formulahendry.terminal \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension njpwerner.autodocstring \
    #&& code-server --install-extension vscodevim.vim@1.18.3 \
    && code-server --install-extension bungcip.better-toml \
    && code-server --install-extension usernamehw.errorlens \
    && code-server --install-extension rust-lang.rust \
    && code-server --install-extension vscjava.vscode-java-pack \
    && code-server --install-extension fwcd.kotlin \
    #&& code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.9.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && xinstall vscode -c --dst-dir /config/data/User/ \
    && chmod -R 777 /root /config \
    && rm -rf /scripts/*.vsix /tmp/* /var/lib/apt/lists/* /var/tmp/*
ENV SHELL=/bin/bash
EXPOSE 8080
