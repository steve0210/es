#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
require 'import'
require 'client'

import = Import.new(ARGF, File.expand_path("../../.env", __FILE__))

puts import.lines.inspect

client = Client.new(import.passwords["elastic"]).client
response = client.cluster.health

puts "#{response.inspect}"
