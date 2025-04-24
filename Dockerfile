FROM quay.io/keycloak/keycloak:26.2.1

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

ENV KC_DB=postgres

COPY ./themes/aaj-theme/theme /opt/keycloak/themes

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]