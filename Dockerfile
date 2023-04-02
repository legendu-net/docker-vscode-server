# NAME: dclong/vscode-server
FROM dclong/jupyterhub-more
# GIT: https://github.com/legendu-net/docker-jupyterhub-more.git

RUN pip3 install -U \
        aiutil github-rest-api \
    && /scripts/sys/purge_cache.sh 
# && code-server --install-extension vscjava.vscode-java-pack \
RUN apt-get update && apt-get install -y valgrind \
    && icon from_github -r cdr/code-server -v ">=3.8.0,<4.11.0" -k amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    && code-server --install-extension formulahendry.terminal \
    && code-server --install-extension vscodevim.vim@1.20.3 \
    && code-server --install-extension mechatroner.rainbow-csv \
    && code-server --install-extension bungcip.better-toml \
    && code-server --install-extension usernamehw.errorlens \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension golang.Go \
    && code-server --install-extension njpwerner.autodocstring \
    && code-server --install-extension rust-lang.rust-analyzer \
    && code-server --install-extension vadimcn.vscode-lldb \
    && code-server --install-extension fwcd.kotlin \
    #&& code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.9.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && icon vscode -c --user-dir /etc/vscode/data/User/ \
    && chmod -R 777 /root/ /etc/vscode/ \
    && /scripts/sys/purge_cache.sh
COPY scripts/ /scripts/
COPY settings/sysctl.conf /etc/sysctl.conf
ENV SHELL=/bin/bash
EXPOSE 8080
