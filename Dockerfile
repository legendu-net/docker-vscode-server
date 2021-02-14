# NAME: dclong/vscode-server
FROM dclong/jupyterhub-more
# GIT: https://github.com/dclong/docker-jupyterhub-more.git

RUN pip3 install git+https://github.com/dclong/dsutil@main
RUN apt-get update \
    && xinstall github -r cdr/code-server -v ">=3.8.0,<3.10.0" -k amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    && code-server --install-extension formulahendry.terminal \
    && code-server --install-extension ms-python.python@2020.10.332292344 \
    && code-server --install-extension njpwerner.autodocstring \
    && code-server --install-extension vscodevim.vim \
    && code-server --install-extension bungcip.better-toml \
    && code-server --install-extension usernamehw.errorlens \
    && code-server --install-extension rust-lang.rust \
    && code-server --install-extension vscjava.vscode-java-pack \
    && code-server --install-extension fwcd.kotlin \
    #&& code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.9.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && xinstall vscode -c --user-dir /etc/vscode/data/User/ \
    && chmod -R 777 /root /etc/vscode \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* 
COPY scripts/ /scripts/
ENV SHELL=/bin/bash
EXPOSE 8080
