curl \
  --insecure \
  --include \
  --no-buffer \
  --header "Connection: Upgrade" \
  --header "Upgrade: websocket" \
  --header "Host: ${PROMETHEUS_ALERTS_HOST}" \
  --header "Origin: https://${PROMETHEUS_ALERTS_HOST}" \
  --header "Sec-WebSocket-Version: 13" \
  --header "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" \
  --header "Authorization: Bearer ${OSH_TOKEN}" \
  https://${PROMETHEUS_ALERTS_HOST}/topics/alerts

#curl -v -k --include --no-buffer --header "Authorization: Bearer ${OSH_TOKEN}"  --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" --header "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" "https://${PROMETHEUS_ALERTS_HOST}/topics/alerts"

