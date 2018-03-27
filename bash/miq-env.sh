printf "#\n"
printf "# OpenShift\n"
printf "#\n"

printf "OPENSHIFT_MASTER_HOST:\n"
printf "${OPENSHIFT_MASTER_HOST}\n"

printf "Openshift Console:\n"
printf "https://${OPENSHIFT_MASTER_HOST}:8443/console/\n"

printf "OPENSHIFT_CA_CRT:\n"
printf "${OPENSHIFT_CA_CRT}"

# TODO: Should this be here
printf "OPENSHIFT_MANAGEMENT_ADMIN_TOKEN:\n"
printf "${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}\n"

printf "#\n"
printf "# ROUTES\n"
printf "#\n"

printf "OPENSHIFT_HAWKULAR_ROUTE:\n"
printf "${OPENSHIFT_HAWKULAR_ROUTE}\n"

printf "OPENSHIFT_PROMETHEUS_ALERTS_ROUTE:\n"
printf "${OPENSHIFT_PROMETHEUS_ALERTS_ROUTE}\n"

printf "OPENSHIFT_PROMETHEUS_METRICS_ROUTE:\n"
printf "${OPENSHIFT_PROMETHEUS_METRICS_ROUTE}\n"

printf "OPENSHIFT_CFME_ROUTE:\n"
printf "${OPENSHIFT_CFME_ROUTE}\n"

printf "OPENSHIFT_ALERTMANAGER_ROUTE:\n"
printf "https://${OPENSHIFT_ALERTMANAGER_ROUTE}\n"
