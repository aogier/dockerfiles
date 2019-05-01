ARG TAG=latest
ARG IMAGE=aogier/alpine-builder-base
ARG BASE=$IMAGE:$TAG

# hadolint ignore=DL3006
FROM $BASE

RUN find /home -type d