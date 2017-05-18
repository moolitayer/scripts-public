
echo "something 3.14" | curl --data-binary @- "http://${PMS_METRICS}/metrics/job/kubernetes-nodes"

  cat <<EOF | curl --data-binary @- "http://${PMS_PUSHGATEWAY}:9091/metrics/job/some_job/instance/some_instance"
  # TYPE some_metric counter
  some_metric{label="val1"} 42
  # This one even has a timestamp (but beware, see below).
  some_metric{label="val2"} 34 1398355504000
  # TYPE another_metric gauge
  # HELP another_metric Just an example.
  another_metric 2398.283
  EOF