require 'rubygems'
require 'zmq'

context = ZMQ::Context.new(1)

sock = context.socket(ZMQ::DOWNSTREAM)
sock.connect("tcp://127.0.0.1:5000")

puts 'downstream start'
for i in 0...10 do
  msg = "count#{i}"
  puts "sending #{msg}"
  sock.send msg
end
sock.send('QUIT')
