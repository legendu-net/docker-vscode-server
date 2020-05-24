FROM dclong/jupyter-nodejs

COPY scripts/ /scripts/
RUN mkdir -p /config/ && chmod 777 /config \
    && apt-get update \
    && curl -L http://www.legendu.net/media/github_release.py | python3 - cdr/code-server -k linux-x86 -o /tmp/code.tar.gz \                                                                                                        
    #&& curl -L https://github.com/cdr/code-server/releases/download/3.0.2/code-server-3.0.2-linux-x86_64.tar.gz -o /tmp/code.tar.gz \
    && tar -zxf /tmp/code.tar.gz -C /opt/ \
    && ln -svf /opt/code-server*/bin/code-server /usr/bin/code-server \
    && code-server --install-extension formulahendry.terminal \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension vscodevim.vim \
    && code-server --install-extension bungcip.better-toml \
    && code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.6.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && chmod -R 777 /root \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
    
ENV SHELL=/bin/bash
EXPOSE 8080
