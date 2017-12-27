#!/usr/bin/env ruby

# Load Rails
ENV['RAILS_ENV'] = ARGV[0] || 'development'
require "/home/mtayer/dev/manageiq/config/environment"

# ManageIQ::Providers::Hawkular::DatawarehouseManager.destroy_all
provider_class=ManageIQ::Providers::Openshift::ContainerManager
# TODO: Does not work, use miq-destroy-provider.rb

provider_class.destroy_all


# provider_class = ManageIQ::Providers::Hawkular::DatawarehouseManager

prov = provider_class.new(
    :name                      => "container",
    :zone                      => Zone.last,
    :connection_configurations => [{:endpoint       => {:role       => :default,
                                                        :hostname   => ENV['OPENSHIFT_MASTER_HOST'],
                                                        :port       => 8443,
                                                        :verify_ssl => false},
                                    :authentication => {:role     => :bearer,
                                                        :auth_key => ENV['OPENSHIFT_MANAGEMENT_ADMIN_TOKEN']}},
                                   {:endpoint       => {:role       => :prometheus_alerts,
                                                        :hostname   => ENV['OPENSHIFT_PROMETHEUS_ALERTS_ROUTE'],
                                                        :port       => 443,
                                                        :verify_ssl => false},
                                    :authentication => {:role     => :prometheus_alerts,
                                                        :auth_key => ENV['OPENSHIFT_MANAGEMENT_ADMIN_TOKEN']}}
                                  ]
)
prov.save
prov.authentication_check_types
EmsRefresh.refresh(prov)

