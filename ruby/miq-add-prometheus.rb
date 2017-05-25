#!/usr/bin/env ruby

# Load Rails
ENV['RAILS_ENV'] = ARGV[0] || 'development'
require "/home/mtayer/dev/manageiq/config/environment"

ManageIQ::Providers::Prometheus::DatawarehouseManager.destroy_all

provider_class = ManageIQ::Providers::Prometheus::DatawarehouseManager

prov = provider_class.new(
    :name                      => "prometheus",
    :zone                      => Zone.last,
    :connection_configurations => [{:endpoint       => {:role       => :default,
                                                        :hostname   => ENV['PMS_ALERTS'],
                                                        :port       => 443,
                                                        :verify_ssl => false},
                                    :authentication => {:role     => :default,
                                                        :auth_key => 'something'}}]
)
prov.save
prov.authentication_check_types(:default)

EmsRefresh.refresh(prov)

