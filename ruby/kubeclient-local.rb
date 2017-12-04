#!/usr/bin/env ruby
require 'kubeclient'

POD = {
  'metadata' => {
    :name => "nginx",
    :namespace => "default",
    :labels => {
      "name" => "nginx"
    },
    :app => "nginx"
  },
  :spec => {
    :containers => [
      {
        :name => "nginx",
        :image => "docker.io/nginx",
        :ports =>[
          {
            :containerPort => 80
          }
        ]
      }
    ]
  }
}


client = Kubeclient::Client.new(
    "https://#{ENV['OSH_HOST']}:8443/api",
    'v1',
    ssl_options: {
      verify_ssl: 0
    },
    auth_options: {
      bearer_token: ENV['OSH_TOKEN']
    }
)

########
# Core #
########
puts client.api_valid?
exit
pod = client.get_pod('nginx', 'default')
puts 'update....'
pod.metadata.labels[:puku] = 'kuku'
ret = client.update_pod(pod)
puts "ret: #{ret} ret.class: #{ret.class} ret.body: #{ret.body}"
puts 'delete.....'
client.delete_pod('nginx', 'default')

exit

nodes = client.get_nodes
begin
  client.get_noges
rescue NoMethodError
  puts 'exception caught'
end

puts client.all_entities


nodes = client.get_nodes
puts nodes

node_count = nodes.count
puts "There are #{node_count} nodes"
puts nodes
puts "*****************************"
nodes.each{|n| puts n}

node = client.get_node('127.0.0.1')
puts "node name: #{node.metadata.name}"
#

entities = client.get_secrets
puts "There are #{entities.count} secrets"
#
client.get_secrets.each {|sec| puts "secret_name: #{sec.metadata.name}"}

# toggle_pod(client)

puts "#{client.get_services.count} services"


service = Kubeclient::Service.new
service.metadata = {}
service.metadata.name = "redis-master"
service.metadata.namespace = 'default'
service.spec = {}
service.spec.ports = [{ 'port' => 6379,
                        'targetPort' => 'redis-server' }]
service.spec.selector = {}
service.spec.selector.name = "redis"
service.spec.selector.role = "master"
service.metadata.labels = {}
service.metadata.labels.app = 'redis'
service.metadata.labels.role = 'slave'
client.create_service(service)

puts "#{client.get_services.count} services"

client.delete_service('redis-master', 'default')

puts "#{client.get_services.count} services"

##########
# Groups #
##########


client = Kubeclient::Client.new('http://localhost:8080/apis/batch' , 'v1', ssl_options: { verify_ssl: 0 })

#
# apiVersion: batch/v1
# kind: Job
# metadata:
#   name: pi
# spec:
#   template:
#     metadata:
#       name: pi
#     spec:
#       containers:
#       - name: pi
#         image: perl
#         command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
#       restartPolicy: Never
#
JOB = {
  'apiVersion' => 'batch/v1',
  'metadata' => {
    'name' => 'pi',
    'namespace' => 'default'
  },
  'spec'     => {
    'template' => {
      'metadata' => {
        'name' => 'pi'
      },
      'spec'    => {
        'containers'   => [
          {
            'name'    => 'pi',
            'image'   => 'perl',
            'command' => ['perl',  '-Mbignum=bpi', '-wle', 'print bpi(2000)']
          }
        ],
        'restartPolicy' => 'Never'
      }
    }
  }
}

# job = Kubeclient::Resource.new
# job.metadata = {}
# job.metadata.name = 'pi'
# job.metadata.namespace = 'default'
# job.spec = {}
# job.spec.template = {}
# job.spec.template.spec = {}
# job.spec.template.spec.restartPolicy = 'Never'
# job.spec.template.spec.containers = [
#   {
#     :name  => 'pi',
#     :image => 'perl',
#     :command => [
#       "perl",
#       "-Mbignum=bpi",
#       "-wle",
#       "print bpi(2000)"
#     ]
#   }
# ]

job = Kubeclient::Resource.new(JOB)

puts "#{client.get_jobs.count} jobs"
client.create_job(job)

puts "#{client.get_jobs.count} jobs"
client.delete_job(job.metadata.name, job.metadata.namespace)
puts "#{client.get_jobs.count} jobs"

client.get_jobs

# Deployments
client = Kubeclient::Client.new('http://localhost:8080/apis/extensions' , 'v1beta1', ssl_options: { verify_ssl: 0 })
client.discover
deployment_json = YAML.load(File.read('/home/mtayer/dev/repo/scripts/data/nginx-deployment.yaml'))
puts "deployment_json #{deployment_json}"
deployment = Kubeclient::Deployment.new(deployment_json)

# apiVersion: extensions/v1beta1
# kind: Deployment
# metadata:
#   name: nginx-deployment
# spec:
#   replicas: 3
#   template:
#     metadata:
#       labels:
#         app: nginx
#     spec:
#       containers:
#       - name: nginx
#         image: nginx:1.7.9
#         ports:
#         - containerPort: 80

client.create_deployment(deployment)
client.delete_deployment('nginx-deployment', 'default')


#############
# OpenShift #
#############
auth_options = {
  bearer_token: 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJtYW5hZ2VtZW50LWluZnJhIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6Im1hbmFnZW1lbnQtYWRtaW4tdG9rZW4tbTlwa24iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoibWFuYWdlbWVudC1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjAwNjc2YjU3LTY5MmMtMTFlNi05ZjgyLTAwMWE0YTIzMTIxYSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDptYW5hZ2VtZW50LWluZnJhOm1hbmFnZW1lbnQtYWRtaW4ifQ.4SzD2JReWQ2Qx3DoYzlF2Dz6fqYgjqSt_qjXfpOdQh85k2Us4yL8Vvrvfi0436QCY3hxNKGvLesvGs8ZCg67UjyNy8DN9A8efJgTFQSnndXM_EDc6eP1xO-DZ1retJV7stPzTzbAo2M3DMHuaYbW9qJxg1nDj8_kh9YXDmsJr2QIf38R3XZIgdh3l85OVCZ9lurC0AIaaMs1evE5yBAKFp6C-T7_2iUfqy5vlPqHlQjnTgMOhAbwEASmOnDEjrSlBDM6ZonW0m7FRYYpjmrMGelrA79ft9LLT-8smte-YrDc-9CACre3VqpC60HG7oIixrrSf8eGe3SgnZTxm6Xu-Q'
}

client = Kubeclient::Client.new('https://mtayer-centos7-3.eng.lab.tlv.redhat.com:8443/oapi' , 'v1', ssl_options: { verify_ssl: 0 }, auth_options: auth_options)
client.discover
puts client.get_templates
