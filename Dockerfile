FROM dclong/jupyter-nodejs

RUN mkdir -p /config/ && chmod 777 /config \
    && apt-get update \
    #&& curl -L http://www.legendu.net/media/github_release.py | python3 - cdr/code-server -k linux-x86 -o /tmp/code.tar.gz \                                                                                                        
    #&& curl -L https://github.com/cdr/code-server/releases/download/3.0.2/code-server-3.0.2-linux-x86_64.tar.gz -o /tmp/code.tar.gz \
    && curl -L https://github.com/cdr/code-server/releases/download/2.1698/code-server2.1698-vsc1.41.1-linux-x86_64.tar.gz -o /tmp/code.tar.gz \
    && tar -zxf /tmp/code.tar.gz -C /usr/bin/ --strip-components=1 --wildcards code-server*/code-server \
    #&& code-server --install-extension formulahendry.terminal \
    #&& code-server --install-extension ms-python.python \
    #&& code-server --install-extension vscodevim.vim \
    && chmod -R 777 /root \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
    
COPY scripts/ /scripts/
ENV SHELL=/bin/bash
EXPOSE 8080
