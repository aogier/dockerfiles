ARG TAG=latest
FROM alpine:$TAG

ARG PORTS=git://dev.alpinelinux.org/aports
ARG SDK_VERSION=1.0-r0
ARG BUILDER_USERNAME=builder

COPY keys /home/$BUILDER_USERNAME/.abuild
# hadolint ignore=DL30
RUN apk update \
    && apk add alpine-sdk=$SDK_VERSION \
    && adduser $BUILDER_USERNAME -DG abuild \
    && chown -Rv \
        $BUILDER_USERNAME: \
        /home/$BUILDER_USERNAME/.abuild

USER $BUILDER_USERNAME

# TODO: ONBUILD git pull if some arg is true
WORKDIR /home/$BUILDER_USERNAME
# TODO pin ports version
RUN git clone --depth 1 $PORTS

# future
ENV BUILDER_USERNAME $BUILDER_USERNAME
ONBUILD ARG BUILDER_USERNAME=$BUILDER_USERNAME
ONBUILD ARG packages=''
# TODO
#ONBUILD ARG update=false

# hadolint ignore=DL3003
ONBUILD RUN for package in $packages; do \
            cd "/home/$BUILDER_USERNAME/aports/$package" \
            && abuild -r \
        ; done \
        && echo ciaone da "$BUILDER_USERNAME"
