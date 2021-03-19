#!/usr/bin/env ruby

require 'elasticsearch'
require 'elasticsearch/xpack'
require 'patron'

PASSWORDS = {}
ARGF.each do |line|
  if m = line.match(/PASSWORD (.*) = (.*)/)
    PASSWORDS[m[1]] = m[2]
  end
end

client = Elasticsearch::Client.new(
  url: %{http://elastic:#{PASSWORDS[%{elastic}]}@localhost:9200}
)
response = client.cluster.health

puts "#{response.inspect}"
