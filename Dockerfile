FROM dclong/jupyter-jdk

RUN mkdir -p /config/ && chmod 777 /config \
    && apt-get update \
    && curl -L http://www.legendu.net/media/download_code_server.py | python3 \
    && tar -zxf /tmp/code.tar.gz -C /usr/bin/ --strip-components=1 --wildcards code-server*/code-server \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
    
COPY scripts/ /scripts/
ENV SHELL=/bin/bash
EXPOSE 8080
