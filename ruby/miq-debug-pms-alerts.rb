#!/usr/bin/env ruby

# Load Rails
ENV['RAILS_ENV'] = ARGV[0] || 'development'
miq_path = ENV['MIQ_DIR'] || '.'
require "#{miq_path}/config/environment"

[EmsEvent.where(:source=>"DATAWAREHOUSE").destroy_all, MiqAlertStatus.destroy_all]

id = ManageIQ::Providers::Openshift::MonitoringManager.first.id

`env QUEUE=ems_#{id} ruby lib/workers/bin/run_single_worker.rb ManageIQ::Providers::Openshift::MonitoringManager::EventCatcher`

