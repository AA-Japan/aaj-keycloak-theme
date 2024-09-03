FROM quay.io/keycloak/keycloak:25.0.4

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

ENV KC_DB=postgres

COPY ./themes/aaj-theme/theme /opt/keycloak/themes

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]