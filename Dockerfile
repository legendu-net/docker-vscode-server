# NAME: dclong/vscode-server
FROM dclong/jupyterhub-more
# GIT: https://github.com/dclong/docker-jupyterhub-more.git

RUN pip3 install git+https://github.com/dclong/dsutil@main \
    && /scripts/sys/purge_cache.sh 
RUN apt-get update \
    && xinstall github -r cdr/code-server -v ">=3.8.0,<3.13.0" -k amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    && code-server --install-extension \
        formulahendry.terminal \
        ms-python.python njpwerner.autodocstring \
        vscjava.vscode-java-pack fwcd.kotlin \
        matklad.rust-analyzer vadimcn.vscode-lldb \
        vscodevim.vim \
        bungcip.better-toml \
        usernamehw.errorlens \
        mechatroner.rainbow-csv \
    #&& code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.9.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && xinstall vscode -c --user-dir /etc/vscode/data/User/ \
    && chmod -R 777 /root /etc/vscode \
    && /scripts/sys/purge_cache.sh
COPY scripts/ /scripts/
ENV SHELL=/bin/bash
EXPOSE 8080
