# {job="kubernetes-nodes"}
#curl "http://${PMS_METRICS}/api/v1/query?query=*node*%7Bjob%3D%22kubernetes-nodes%22%7D"
curl "http://${PMS_METRICS}/api/v1/query?query=%7Bjob%3D%22kubernetes-nodes%22%7D&instance=vm-48-124.eng.lab.tlv.redhat.com"

