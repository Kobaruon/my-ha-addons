ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    curl \
    tar

WORKDIR /app

# Download Glance
ARG BUILD_ARCH
ARG GLANCE_VERSION="v0.8.4"

RUN \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="linux-arm64"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="linux-amd64"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="linux-armv7"; fi \
    && curl -L -o /tmp/glance.tar.gz "https://github.com/glanceapp/glance/releases/download/${GLANCE_VERSION}/glance-${ARCH}.tar.gz" \
    && tar -xzf /tmp/glance.tar.gz -C /app \
    && rm /tmp/glance.tar.gz \
    && chmod a+x /app/glance

# Get default config
RUN curl -L -o /app/glance-default.yml "https://raw.githubusercontent.com/glanceapp/glance/main/docs/glance.yml"

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
