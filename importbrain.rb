#!/usr/bin/env ruby

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.join(File.dirname(__FILE__), 'config/boot')
require "#{RAILS_ROOT}/config/environment"

Factoid.delete_all
Trigger.delete_all
Response.delete_all

@brain = File.open("db/bucket-brain.yaml") { |f| YAML::load(f) }

@brain.each do |k,v| 
  next unless k
  f = Factoid.create
  t = f.triggers.find_or_create_by_value(k)
  v.each do |r| 
    f.responses.find_or_create_by_value(r)
    puts "#{k} => #{r}"
  end
end