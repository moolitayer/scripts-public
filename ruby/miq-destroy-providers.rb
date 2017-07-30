#!/usr/bin/env ruby

def destroy_providers

  sleep_interval=10

  ExtManagementSystem.update_all(:enabled=>false)
  ap "Sleeping #{sleep_interval} seconds so that providers can be killed..."
  sleep(sleep_interval)
  ExtManagementSystem.destroy_all


end


# Load Rails
ENV['RAILS_ENV'] = ARGV[0] || 'development'
require "/home/mtayer/dev/manageiq/config/environment"




destroy_providers

