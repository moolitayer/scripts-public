curl -k -s \
    -H "Authorization: Bearer $OPENSHIFT_MANAGEMENT_ADMIN_TOKEN" \
    "http://${OPENSHIFT_PROMETHEUS_METRICS_ROUTE}/api/v1/query_range?query=kubelet_docker_operations_latency_microseconds&start=1494947776.865&end=1494951376.865&step=14" | jq .

