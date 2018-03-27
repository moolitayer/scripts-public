# TODO: use ssl
cat <<EOF | curl -X POST -H "Content-Type: application/json" -u "admin:smartvm" --data @- "localhost:3000/api/providers"
{
"name": "container",
"zone_id": 1,
  "type": "ManageIQ::Providers::Openshift::ContainerManager",
"connection_configurations": [
     {
       "endpoint": {
         "role": "default",
         "hostname": "${OPENSHIFT_MASTER_HOST}",
         "port": 8443,
         "security_protocol": "ssl-without-validation"
       },
       "authentication": {
         "role": "bearer",
         "auth_key": "${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}"
       }
     },
     {
       "endpoint": {
         "role": "prometheus_alerts",
         "hostname": "${OPENSHIFT_PROMETHEUS_ALERTS_ROUTE}",
         "port": 443,
         "security_protocol": "ssl-without-validation"
       },
       "authentication": {
         "role": "prometheus_alerts",
         "auth_key": "${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}"
       }
     },
     {
       "endpoint": {
         "role": "prometheus",
         "hostname": "${OPENSHIFT_PROMETHEUS_METRICS_ROUTE}",
         "port": 443,
         "security_protocol": "ssl-without-validation"
       },
       "authentication": {
         "role": "prometheus",
         "auth_key": "${OPENSHIFT_MANAGEMENT_ADMIN_TOKEN}"
       }
     }

   ]
}
EOF

