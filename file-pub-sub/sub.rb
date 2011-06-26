#!/usr/bin/env ruby
require 'rubygems'
require 'zmq'
require 'base64'
require 'json'

ctx = ZMQ::Context.new
sock= ctx.socket(ZMQ::SUB)
sock.connect('tcp://127.0.0.1:5000')
sock.setsockopt(ZMQ::SUBSCRIBE, '')

loop do
  begin
    data = JSON.parse(sock.recv)
  rescue => e
    STDERR.puts e
    next
  end

  begin
    File.open(data['name'].gsub(/\//,'_'),'w+'){|f|
      bin = Base64.decode64(data['data'])
      raise Error.new('size error') if bin.size != data['size']
      f.write(bin)
    }
    puts "saved #{data['name']}"
  rescue => e
    STDERR.puts e
  end
end
