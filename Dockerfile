ARG ALPINE_VERSION=3.23
FROM alpine:${ALPINE_VERSION}

ARG FOSSIL_DIR=/opt/fossil
ARG USERNAME=www-data
ARG USERID=33

ENV FOSSIL_PORT=8080
ENV FOSSIL_DIR=${FOSSIL_DIR}

RUN apk update && \
    apk  --no-cache add shadow fossil && \
    groupmod -g ${USERID} ${USERNAME} && \
    adduser -h ${FOSSIL_DIR} -s /bin/false -D -u ${USERID} -G ${USERNAME} ${USERNAME}

USER ${USERID}:${USERID}
WORKDIR ${FOSSIL_DIR}

# RUN fossil init --user ${USERNAME} alpha.fossil
# RUN fossil init --user ${USERNAME} beta.fossil

CMD ["sh", "-c", "exec fossil server --port ${FOSSIL_PORT} --repolist ${FOSSIL_DIR}"]
