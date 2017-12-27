curl \
  --insecure \
  --include \
  --no-buffer \
  --header "Connection: Upgrade" \
  --header "Upgrade: websocket" \
  --header "Host: ${OPENSHIFT_PROMETHEUS_ALERTS_ROUTE}" \
  --header "Origin: https://${OPENSHIFT_PROMETHEUS_ALERTS_ROUTE}" \
  --header "Sec-WebSocket-Version: 13" \
  --header "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" \
  --header "Authorization: Bearer ${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}" \
  https://${OPENSHIFT_PROMETHEUS_ALERTS_ROUTE}/topics/alerts

#curl -v -k --include --no-buffer --header "Authorization: Bearer ${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}"  --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" --header "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" "https://${OPENSHIFT_PROMETHEUS_ALERTS_ROUTE}/topics/alerts"

