FROM debian:9

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        texlive-latex-base=2016.20170123-5 \
        texlive-binaries=2016.20160513.41080.dfsg-2+deb9u1 \
        texlive-latex-extra=2016.20170123-5 \
        curl=7.52.1-5+deb9u9 \
        jq=1.5+dfsg-1.3 \
    && rm -fr /var/lib/apt/lists/*
