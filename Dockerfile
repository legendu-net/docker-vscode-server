# NAME: dclong/vscode-server
FROM dclong/jupyterhub-more
# GIT: https://github.com/legendu-net/docker-jupyterhub-more.git

RUN pip3 install -U --break-system-packages \
#RUN pip3 install -U \
        aiutil github-rest-api \
    && /scripts/sys/purge_cache.sh 
# && code-server --install-extension vscjava.vscode-java-pack \
RUN apt-get -y update && apt-get -y install valgrind \
    && icon from_github -r cdr/code-server -v ">=4.99.0,<4.107.0" -k amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    #&& code-server --install-extension vscodevim.vim@1.27.2 \
    && code-server --install-extension google.gemini-cli-vscode-ide-companion \
    && code-server --install-extension asvetliakov.vscode-neovim@1.18.24 \
    && code-server --install-extension mechatroner.rainbow-csv \
    && code-server --install-extension usernamehw.errorlens \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension golang.Go \
    && code-server --install-extension njpwerner.autodocstring \
    && code-server --install-extension rust-lang.rust-analyzer \
    && code-server --install-extension serayuzgur.crates \
    && code-server --install-extension vadimcn.vscode-lldb \
    && code-server --install-extension fwcd.kotlin \
    && code-server --install-extension karsten7.mojo-vscode \
    #&& code-server --install-extension model-checking.kani-vscode-extension \
    #&& code-server --install-extension modular-mojotools.vscode-mojo \
    #&& code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.9.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && icon vscode -c --copy --user-dir /etc/vscode/data/User/ \
    && chmod -R 777 /root/ /etc/vscode/ \
    && /scripts/sys/purge_cache.sh
COPY scripts/ /scripts/
COPY settings/sysctl.conf /etc/sysctl.conf
ENV SHELL=/bin/bash
EXPOSE 8080
