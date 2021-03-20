#!/usr/bin/env ruby

path = File.join("..", "..")
$LOAD_PATH.unshift(File.expand_path(File.join(path, "lib"), __FILE__))
require 'import'
require 'client'

import = Import.new(ARGF, File.expand_path(File.join(path, ".env"), __FILE__))

import.lines.each { |line| puts line }
puts ""

client = Client.new(
  import.passwords["elastic"],
  File.expand_path(File.join(path, "config", "users.yml"), __FILE__)
)

# puts client.users.inspect
#response = client.client.cluster.health
