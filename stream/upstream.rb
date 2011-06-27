require 'rubygems'
require 'zmq'

context = ZMQ::Context.new(1)
sock = context.socket(ZMQ::UPSTREAM)
sock.bind('tcp://127.0.0.1:5000')

puts 'upstream start'
loop do
  p data = sock.recv
  break if data == "QUIT"
end
