#!/usr/bin/env ruby
require 'fileutils'
[
  '/home/mtayer/dev/manageiq/log/evm.log',
  '/home/mtayer/dev/manageiq/log/development.log',
  '/home/mtayer/dev/manageiq/log/policy.log',
  '/home/mtayer/dev/manageiq/log/middleware.log',
  '/home/mtayer/dev/manageiq/log/monitoring.log',
  '/home/mtayer/dev/manageiq/log/datawarehouse.log',
  '/home/mtayer/dev/manageiq/log/rhevm.log',
  '/home/mtayer/dev/manageiq/log/api.log',
  '/home/mtayer/dev/manageiq/log/automation.log',
  '/home/mtayer/dev/manageiq/log/last_settings.txt',
  '/home/mtayer/dev/manageiq/log/kubernetes.log'
].each do |log_file|
  File.open(log_file, 'w') {|file| file.write("")}
  FileUtils.cp(log_file, '/home/mtayer/Archive/logs')
end
