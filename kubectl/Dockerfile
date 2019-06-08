ARG ALPINE_TAG=3.9.4
FROM alpine:${ALPINE_TAG}

ARG PYTHON3_VERSION=3.6.8-r2
ARG KUBECTL_VERSION=1.14.0

RUN apk add --no-cache \
        python3=${PYTHON3_VERSION} \
    && pip3 install yq \
    && wget -qO /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/bin/kubectl

USER 1000

ENTRYPOINT /usr/bin/kubectl
