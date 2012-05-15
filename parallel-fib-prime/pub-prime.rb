#!/usr/bin/env ruby
require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::DOWNSTREAM)
sock.connect("ipc:///tmp/fib-prime")

limit = ARGV.empty? ? 10000 : ARGV.shift.to_i

def valid?(num)
  2.upto(num/2) do |i|
    return false if num%i == 0
  end
  true
end

i = 2
loop do
  if valid? i
    puts i
    sock.send "prime : #{i}"
  end
  i += 1
  break if limit and limit < i
end
