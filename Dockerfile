FROM debian:buster-slim

ARG TRUFFLEHOG_VERSION="3.4.1"
ARG TRUFFLEHOG_CHECKSUM="260fd0923074fb7e0e69ba825167eeda245115a5771e47e12a1a7d23ae8ce71e"

RUN set -x && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -Lo trufflehog.tar.gz "https://github.com/trufflesecurity/trufflehog/releases/download/v${TRUFFLEHOG_VERSION}/trufflehog_${TRUFFLEHOG_VERSION}_linux_amd64.tar.gz" \
    && echo "${TRUFFLEHOG_CHECKSUM} trufflehog.tar.gz" | sha256sum --check \
    && tar -xf trufflehog.tar.gz \
    && mv trufflehog /usr/local/bin/ \
    && rm trufflehog.tar.gz

ENTRYPOINT ["ls -laR && /usr/local/bin/trufflehog"]