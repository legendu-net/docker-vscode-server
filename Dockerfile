FROM dclong/ubuntu_b

# environment settings
ENV HOME="/config"

RUN apt-get update \
    && apt-get install -y \
    && CODE_RELEASE=$(curl -sX GET "https://api.github.com/repos/cdr/code-server/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]') \
    && curl -L "https://github.com/cdr/code-server/releases/download/${CODE_RELEASE}/code-server${CODE_RELEASE}-linux-x86_64.tar.gz" -o /tmp/code.tar.gz \
    && tar -zxf /tmp/code.tar.gz -C /usr/bin/ --strip-components=1 --wildcards code-server*/code-server \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# add local files
COPY /root /
EXPOSE 8080