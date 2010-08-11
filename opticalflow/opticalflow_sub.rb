#!/usr/bin/env ruby
require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock= ctx.socket(ZMQ::SUB)
sock.connect('tcp://127.0.0.1:5000')
sock.setsockopt(ZMQ::SUBSCRIBE, 'opticalflow') # all

loop do
  puts sock.recv()
end
