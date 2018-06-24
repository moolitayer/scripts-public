#!/bin/bash

for host in "mt01-compute001.10.35.48.42.cmio.eng.lab.tlv.redhat.com" "mt01-compute002.10.35.48.45.cmio.eng.lab.tlv.redhat.com" "mt01-infra001.10.35.48.40.cmio.eng.lab.tlv.redhat.com" "mt01-infra002.10.35.48.43.cmio.eng.lab.tlv.redhat.com" "mt01-master001.10.35.48.41.cmio.eng.lab.tlv.redhat.com"
do  
    #ssh-copy-id root@$host
    scp *.tar template.* root@$host:.
    # load images	
    ssh root@$host docker load -i dedicated-portal_clusters-service_0.0.0.tar
    ssh root@$host docker load -i dedicated-portal_customers-portal_0.0.0.tar 	
    ssh root@$host docker load -i dedicated-portal_customers-service_0.0.0.tar
    ssh root@$host docker load -i dedicated-portal_messaging-service_0.0.0.tar
done  

oc cluster down
make images

for img in "messaging-service" "customers-service" "customers-portal" "clusters-service"
do
    sudo docker rmi "dedicated-portal/${img}:0.0.0"
done

for img in "dedicated-portal_clusters-service_0.0.0.tar" "dedicated-portal_customers-portal_0.0.0.tar" "dedicated-portal_customers-service_0.0.0.tar" "dedicated-portal_messaging-service_0.0.0.tar"
do
    sudo docker load -i $img
done
oc cluster up
oc delete namespace dedicated-portal && sleep 10
./template.sh
