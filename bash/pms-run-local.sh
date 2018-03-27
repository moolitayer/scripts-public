# scraping target on localhost:5000, using https://github.com/prometheus/client_ruby/tree/master/examples/rack
pushd /home/mtayer/dev/client_ruby/examples/rack
bundle exec unicorn -c ./unicorn.conf
popd

# prometheus on localhost:9090 (build using `promu build`)
/home/mtayer/dev/gopath/src/github.com/prometheus/prometheus/prometheus \
    --config.file /home/mtayer/dev/repo/scripts/data/prometheus.yml \
    --storage.tsdb.path=/tmp/prometheus \
    --web.enable-lifecycle \
    --log.level debug

# alertmanager on localhost:9093 (build using `promu build`)
/home/mtayer/dev/gopath/src/github.com/prometheus/alertmanager/alertmanager \
    --config.file /home/mtayer/dev/repo/scripts/data/alertmanager.yml \
    --storage.path /tmp/alertmanager \
    --log.level debug

# SMTP on localhost:25
sudo java -jar /home/mtayer/dev/FakeSMTP/target/fakeSMTP-2.1-SNAPSHOT.jar

What happens to firing alerts in prometheus after restart[1]?

There are no alerts after restart. Method:
- trigger alert
- restart prometheus
- view alerts screen

What happens to firing alerts in prometheus after configuration reload?

They disappear from the firing alerts list
- remove definition in rules.yml file
- reload configuration using `curl -X POST http://localhost:9090/-/reload`
- view alerts screen

What happens to firing alerts in prometheus after removing their definition and running configuration reload?
They are removed from prometheus after a while. Controlled by a setting resolve_timeout

What happens to active alerts in alermanager after restart?
Alerts are not persisted

http_requests_total{code="200",instance="localhost:9093",job="alertmanager"}

If a metric is not available, how long will prometheus keep the last value it has?

[1]

```
oc scale rc -n ${NS} dummy --replicas=10 # trigger an alert, see README.md
# List firing alerts
curl -k -s -H "Authorization: Bearer ${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}" "https://${OPENSHIFT_PROMETHEUS_METRICS_ROUTE}/api/v1/query?query=ALERTS" | jq ".data.result | length"
# Delete prometheus
oc delete pod -n openshift-metrics prometheus-0
# Watch alert
curl -k -s -H "Authorization: Bearer ${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}" "https://${OPENSHIFT_PROMETHEUS_METRICS_ROUTE}/api/v1/query?query=ALERTS" | jq ".data.result | length"
```
oc delete pod -n openshift-metrics prometheus-0
