curl  -X POST -H "Authorization: Bearer ${OSH_TOKEN}" -k "https://${PROMETHEUS_METRICS_ROUTE}/-/reload"
