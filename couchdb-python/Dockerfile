# vim: syntax=dockerfile
FROM couchdb:2.3.0

RUN apt-get update \
    && apt-get --no-install-recommends install -y \
        python3-setuptools=33.1.1-1 \
        python3-pip=9.0.1-2 \
        git=1:2.11.0-3+deb9u4 \
    && pip3 install git+https://github.com/aogier/couchdb-python@bugfix/py3 \
    && apt-get purge -y python3-setuptools python3-pip git \
    && apt-get autoremove -y \
    && rm -fr /var/lib/apt/lists/*

ENV COUCHDB_QUERY_SERVER_PYTHON /usr/bin/python3 /usr/local/bin/couchpy
