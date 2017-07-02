#!/usr/bin/env ruby
require File.join(Dir.pwd, 'config/environment')


cn = ContainerNode.first

MiqAlertStatus.where(:url => 'www.example.com').destroy_all

MiqAlertStatus.create!(
  :miq_alert_id => MiqAlert.last.id,
  :resource_id => cn.id,
  :resource_type => cn.class.name,
  :evaluated_on => Time.zone.now,
  :result => true,
  :url => 'www.example.com',
  :severity => 'error',
  :ems_id => cn.ems_id,
  :description => "Something went wrong",
  :resolved => false
)
MiqAlertStatus.create!(
  :miq_alert_id => MiqAlert.last.id,
  :resource_id => cn.id,
  :resource_type => cn.class.name,
  :evaluated_on => Time.zone.now,
  :result => true,
  :url => 'www.example.com',
  :severity => 'info',
  :ems_id => cn.ems_id,
  :description => "Something went wrong",
  :resolved => false
)
MiqAlertStatus.create!(
  :miq_alert_id => MiqAlert.last.id,
  :resource_id => cn.id,
  :resource_type => cn.class.name,
  :evaluated_on => Time.zone.now,
  :result => true,
  :url => 'www.example.com',
  :severity => 'warning',
  :ems_id => cn.ems_id,
  :description => "Something went wrong",
  :resolved => false
)

# Should not be visible
MiqAlertStatus.create!(
  :miq_alert_id => MiqAlert.last.id,
  :resource_id => cn.id,
  :resource_type => cn.class.name,
  :evaluated_on => Time.zone.now,
  :result => true,
  :url => 'www.example.com',
  :severity => 'error',
  :ems_id => cn.ems_id,
  :description => "Something went wrong",
  :resolved => true
)
