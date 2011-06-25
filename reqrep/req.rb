#!/usr/bin/env ruby
## server
require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::REQ)
sock.bind("tcp://127.0.0.1:5000")

arr = (0...100).to_a

while !arr.empty? do
  msg = arr.shift.to_s
  sock.send msg
  puts "send #{msg}"
  recv = sock.recv
  puts "<- #{recv}"
end
