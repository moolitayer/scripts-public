cat <<EOF | curl -X POST -H "Content-Type: application/json" -u "admin:smartvm" --data @- "localhost:3000/api/providers"
{
"name": "container",
"zone_id": 1,
  "type": "ManageIQ::Providers::Openshift::ContainerManager",
"connection_configurations": [
     {
       "endpoint": {
         "role": "default",
         "hostname": "ocp-master01.10.35.48.189.xip.io",
         "port": 8443
       },
       "authentication": {
         "role": "bearer",
         "auth_key": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJtYW5hZ2VtZW50LWluZnJhIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6Im1hbmFnZW1lbnQtYWRtaW4tdG9rZW4tZnJyeDgiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoibWFuYWdlbWVudC1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjRhODY5NDczLWQ1ZGQtMTFlNy1iNjhlLTAwMWE0YTE2MjZiZCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDptYW5hZ2VtZW50LWluZnJhOm1hbmFnZW1lbnQtYWRtaW4ifQ.UhGy45pjWTak0NznD1v2rQtbf-XYis_5_ZKqVL0o7_4NFc69hsZZ4i_pSl2Pb4qsyNhWyZRY0JpKmBDz8CXIiZTb92laqrg_QQO4qMxo1nn2dHq_8nsMfdMAzR_dDzbUAlyPjhLMqUU9CecWzTodZ_PxLEfjZpMw8qIVAtca5fl5xgK1TbvnBdbnD_wK57PphadAZ1MCUdgzNgrs58WC59R1dv0lCL15UEXxamowLDZy1zWOG-WiHxFz5wN5iN7KCkPMnABOLoQ4k53kg-4sZzwqCPziUqyWm0mer2TwLzhqkuztzJnQ9AQBtt1kWvFKmPfGDUZ91bfGNfKeyd1gFw"
       }
     }
   ]
}
EOF

