#!/bin/bash

curl -k -s \
    -H "Authorization: Bearer $OPENSHIFT_MANAGEMENT_ADMIN_TOKEN" \
    https://$OPENSHIFT_MASTER_HOST:8443/api/v1/pods
