#!/usr/bin/env ruby
require 'json'
require 'digest'

def get_key(annotations, labels, event)
  Digest::SHA256.hexdigest(
    (
      annotations.sort.flatten +
      labels.sort.flatten +
      ["startsAt", event["startsAt"]]
    ).join('|')
  )
end

items=0
indexes = []
messages = []
keys = []
nodes = {}
alerts = {}
data_hash = JSON.parse(ARGF.read)
data_hash["messages"].each do |message|
  indexes << message["index"]
  messages << message["data"]["alerts"].size
  message["data"]["alerts"].each do |alert|
    nodes[alert['labels']['instance']] = true 
    key = get_key(alert["annotations"], alert["labels"], alert)
    keys << key
    items+=1
    entry = alerts[key] || []
    entry << "#{alert['status']}"

    alerts[key] = entry
  end
end



puts "generation: #{data_hash["generationID"]}"
puts "intems: #{items}"
puts "#{indexes.count} indexes: #{indexes.zip(messages).join(',')}"
puts "#{nodes.keys.count} effected nodes: #{nodes.keys.join(' ')}"
active = 0
alerts.each do |key, val|
  puts "Alert [#{val}] is [#{val.last}]"
  active+=1 if val.last == 'firing'
    
end
puts "#{alerts.count} distinct cases identified, #{active} are active"
puts "keys: #{keys.count} unique: #{keys.uniq.count}"