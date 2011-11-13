#!/usr/bin/env ruby
## server
require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::REP)
sock.bind("tcp://127.0.0.1:5000")

loop do
  puts recv = sock.recv
  result = recv.to_i*1000
  sleep rand(3)
  puts "reply #{result}"
  sock.send result.to_s
end
