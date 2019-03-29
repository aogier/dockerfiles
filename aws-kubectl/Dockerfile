FROM alpine:3.9.2

RUN apk add --no-cache curl py2-pip \
	&& curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl \
	&& chmod +x /usr/local/bin/kubectl \
	&& pip install awscli --upgrade \
	&& rm -fr /root/.cache \
	&& apk del curl py2-pip
