#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'zmq'

ctx = ZMQ::Context.new
sock = ctx.socket(ZMQ::UPSTREAM)
sock.bind("ipc:///tmp/fib-prime")

h = Hash.new
cats = ['prime', 'fib']

loop do
  data = sock.recv
  cat, num = data.scan(/^(prime|fib)\s*:\s*(\d+)$/)[0] rescue next
  if h[num] == (cats-[cat])[0]
    puts num
  else
    h[num] = cat
  end
end
