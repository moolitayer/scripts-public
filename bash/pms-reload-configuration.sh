curl  -X POST -H "Authorization: Bearer ${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}" -k "https://${OPENSHIFT_PROMETHEUS_METRICS_ROUTE}/-/reload"
