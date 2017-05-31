oc create namespace prometheus
oc project prometheus
oc process -f prometheus.yaml -v NAMESPACE=prometheus | oc create -f -


#oc new-app prometheus
#oc new-app alertmanager
