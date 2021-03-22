#!/usr/bin/env ruby

path = File.join("..", "..")
$LOAD_PATH.unshift(File.expand_path(File.join(path, "lib"), __FILE__))
require 'import'
require 'client'

import = Import.new(ARGF, File.expand_path(File.join(path, "kibana", ".env"), __FILE__))

client = Client.new(
  File.expand_path(File.join(path, "config"), __FILE__),
  import.passwords["elastic"]
)

client.send_roles
client.send_users

import.lines.each { |line| puts line }
puts ""
#puts client.users.inspect
#response = client.client.cluster.health
