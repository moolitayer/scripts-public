./osh-delete-prometheus.sh

oc create namespace prometheus
oc process -f prometheus.yaml -v NAMESPACE=prometheus | oc create -f -


#oc new-app prometheus
#oc new-app alertmanager
