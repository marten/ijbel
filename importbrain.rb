#!/usr/bin/env ruby
require File.expand_path('../config/boot',  __FILE__)

Trigger.delete_all
Response.delete_all

@brain = File.open("db/bucket-brain.yaml") { |f| YAML::load(f) }

@brain.each do |k,v| 
  f = Trigger.find_or_create_by_value(k)
  v.each do |r| 
    f.responses.create(:value => r)
    puts "#{k} => #{v}"
  end
end
