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
                                                        :hostname   => ENV['OSH_HOST'],
                                                        :port       => 8443,
                                                        :verify_ssl => false},
                                    :authentication => {:role     => :bearer,
                                                        :auth_key => ENV['OSH_TOKEN']}},
                                   {:endpoint       => {:role       => :prometheus_alerts,
                                                        :hostname   => ENV['PROMETHEUS_ALERTS_HOST'],
                                                        :port       => ENV['PROMETHEUS_ALERTS_PORT'],
                                                        :verify_ssl => false},
                                    :authentication => {:role     => :prometheus_alerts,
                                                        :auth_key => ENV['OSH_TOKEN']}}
                                  ]
)
prov.save
prov.authentication_check_types
EmsRefresh.refresh(prov)

