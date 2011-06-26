#!/usr/bin/env ruby
require 'rubygems'
require 'zmq'
require 'base64'
require 'json'

if ARGV.size < 1
  STDERR.puts 'files required'
  exit 1
end
dir = ARGV.first

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::PUB)
sock.bind("tcp://127.0.0.1:5000")

ARGV.each{|name|
  puts "sending #{name}..."
  bin = File.open(name).read
  data = {
    :name => name,
    :data => Base64.encode64(bin),
    :size => bin.size
  }
  sock.send(data.to_json)
}
