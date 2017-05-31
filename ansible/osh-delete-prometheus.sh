oc delete serviceaccount prometheus

oc delete clusterrolebinding prometheus-cluster-reader

oc delete service prometheus
oc delete service alertmanager
oc delete service pushgateway

oc delete deployment prometheus

oc delete configmap prometheus
oc delete configmap alertmanager

oc delete route prometheus
oc delete route alertmanager
oc delete route pushgateway

oc delete namespace prometheus