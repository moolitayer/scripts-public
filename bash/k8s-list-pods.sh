#!/bin/bash

curl -k -s \
    -H "Authorization: Bearer $OSH_TOKEN" \
    https://$OSH_HOST:8443/api/v1/pods
