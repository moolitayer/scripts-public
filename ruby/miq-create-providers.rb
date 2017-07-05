#!/usr/bin/env ruby

# Load Rails
ENV['RAILS_ENV'] = ARGV[0] || 'development'
require "/home/mtayer/dev/manageiq/config/environment"

# ManageIQ::Providers::Hawkular::DatawarehouseManager.destroy_all
ManageIQ::Providers::Openshift::ContainerManager.destroy_all
ManageIQ::Providers::Openshift::MonitoringManager.destroy_all

# provider_class = ManageIQ::Providers::Hawkular::DatawarehouseManager

prov = provider_class.new(
    :name                      => "container",
    :zone                      => Zone.last,
    :connection_configurations => [{:endpoint       => {:role       => :default,
                                                        :hostname   => ENV['HAWKULAR_HOST'],
                                                        :port       => 443,
                                                        :verify_ssl => false},
                                    :authentication => {:role     => :default,
                                                        :auth_key => ENV['HAWKULAR_TOKEN']}},
                                   {:endpoint       => {:role       => :prometheus_alerts,
                                                        :hostname   => ENV['PROMETHEUS_ALERTS_HOST'],
                                                        :port       => 9099,
                                                        :verify_ssl => false},
                                    :authentication => {:role     => :prometheus_alerts,
                                                        :auth_key => ENV['HAWKULAR_TOKEN']}}
                                  ]
)
prov.save
prov.authentication_check_types
EmsRefresh.refresh(prov)

