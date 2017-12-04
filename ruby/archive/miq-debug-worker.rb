#!/usr/bin/env ruby
# Load Rails
ENV['RAILS_ENV'] = ARGV[0] || 'development'
require "/home/mtayer/dev/manageiq/config/environment"

worker_class = ManageIQ::Providers::Openshift::MonitoringManager::EventCatcher
runner_class = worker_class::Runner

worker = worker_class.create_worker_record

runner_cfg = {
  :guid   => worker.guid,
  :ems_id => ManageIQ::Providers::Openshift::MonitoringManager::EventCatcher.ems_class.first.id
}

puts runner_cfg

runner = runner_class.new(runner_cfg)

# require 'byebug'
# byebug

runner.start
