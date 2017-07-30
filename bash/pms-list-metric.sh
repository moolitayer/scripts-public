curl -k -s \
    -H "Authorization: Bearer $OSH_TOKEN" \
    "http://${PROMETHEUS_METRICS_HOST}/api/v1/query_range?query=kubelet_docker_operations_latency_microseconds&start=1494947776.865&end=1494951376.865&step=14" | jq .

