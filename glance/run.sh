#!/usr/bin/with-contenv bashio

GLANCE_CONFIG_DIR="/config/glance"
GLANCE_CONFIG_FILE="$GLANCE_CONFIG_DIR/glance.yml"

bashio::log.info "Checking for Glance configuration..."

if [ ! -f "$GLANCE_CONFIG_FILE" ]; then
    bashio::log.info "Configuration file not found. Creating default configuration at $GLANCE_CONFIG_FILE"
    mkdir -p "$GLANCE_CONFIG_DIR"
    cp /app/glance-default.yml "$GLANCE_CONFIG_FILE"
else
    bashio::log.info "Configuration file found at $GLANCE_CONFIG_FILE"
fi

bashio::log.info "Starting Glance on port 9191..."
export GLANCE_SERVER_PORT=9191
exec /app/glance --config "$GLANCE_CONFIG_FILE"
