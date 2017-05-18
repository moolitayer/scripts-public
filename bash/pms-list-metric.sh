# {job="kubernetes-nodes"}
#curl "http://${PMS_METRICS}/api/v1/query?query=*node*%7Bjob%3D%22kubernetes-nodes%22%7D"
curl "http://${PMS_METRICS}/api/v1/query_range?query=kubelet_docker_operations_latency_microseconds&start=1494947776.865&end=1494951376.865&step=14" | jq .

