#!/usr/bin/env ruby
require 'json'

# def with_file
#
# end

def parse_output
  indexes = []
  nodes = {}
  alerts = {}
  file = ARGF.read
  data_hash = JSON.parse(file)
  data_hash["messages"].each do |message|
    indexes << message["index"]
    message["data"]["alerts"].each do |alert|
      nodes[alert['labels']['instance']] = true 
      key = [alert['startsAt'], alert['labels']['instance'], alert['labels']['alertname']]
      entry = alerts[key] || []
      entry << "#{alert['status']}"
      alerts[key] = entry
    end
  end


  puts "generation: #{data_hash["generationID"]}"
  puts "#{indexes.count} messages: #{indexes.join(' ')}"
  puts "#{nodes.keys.count} effected nodes: #{nodes.keys.join(' ')}"
  active = 0
  alerts.each do |key, val|
    puts "Alert [#{key[2]}] on node [#{key[1]}] started at [#{key[0]}] is [#{val.last}]"
    active+=1 if val.last == 'firing'
    
  end
  puts "#{alerts.count} distinct cases identified, #{active} are active"
end

parse_output