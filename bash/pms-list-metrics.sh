echo $PROMETHEUS_METRICS_ROUTE
curl -k -s \
    -H "Authorization: Bearer $OSH_TOKEN" \
    "https://${PROMETHEUS_METRICS_ROUTE}/api/v1/query?query=%7Bjob%3D%22kubernetes-nodes%22%7D&instance=vm-48-124.eng.lab.tlv.redhat.com"

