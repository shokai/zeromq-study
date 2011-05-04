#!/usr/bin/env ruby

require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::PUB)
sock.bind("tcp://127.0.0.1:5000")

countries = ['japan', 'germany', 'netherlands', 'brazil']
events = ['yellow card', 'red card', 'goal', 'corner', 'foul']

loop do
  msg = "#{countries.choice} #{events.choice}"
  puts "-> #{msg}"
  sock.send(msg)
end
