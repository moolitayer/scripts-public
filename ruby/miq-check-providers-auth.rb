#!/usr/bin/env ruby

# Load Rails
ENV['RAILS_ENV'] = ARGV[0] || 'development'
require "/home/mtayer/dev/manageiq/config/environment"

ExtManagementSystem.map(&:authentication_check_types)
