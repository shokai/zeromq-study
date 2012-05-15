#!/usr/bin/env ruby
require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::DOWNSTREAM)
sock.connect("ipc:///tmp/fib-prime")

limit = ARGV.empty? ? 10000 : ARGV.shift.to_i

fib=[0,1,1];
loop do
  puts fib[0]
  sock.send "fib : #{fib[0]}"
  fib.shift
  fib.push(fib[0]+fib[1])
  break if limit and limit < fib[0]
end
