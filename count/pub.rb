#!/usr/bin/env ruby
require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::PUB)
sock.bind("tcp://127.0.0.1:5000")

puts 'pub start'
count = 0
loop do
  puts msg = "count #{count}"
  sock.send(msg)
  count += 1
  sleep 1
end
