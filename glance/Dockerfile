ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    curl \
    tar

# Download Glance
ARG BUILD_ARCH
ARG GLANCE_VERSION="v0.4.1"

RUN \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="linux-arm64"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="linux-amd64"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="linux-arm"; fi \
    && curl -L -o /app/glance "https://github.com/glanceapp/glance/releases/download/${GLANCE_VERSION}/glance-${ARCH}" \
    && chmod a+x /app/glance

# Get default config
RUN curl -L -o /app/glance-default.yml "https://raw.githubusercontent.com/glanceapp/glance/main/docs/glance.yml"

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
