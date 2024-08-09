require 'socket'

def start_server(addr, port)
  server_socket = UDPSocket.new
  server_socket.bind(addr, port)
  
  puts "UDP server listening on #{addr}:#{port}"

  loop do
    data, address = server_socket.recvfrom(1024)
    puts "Message de #{address[1]}: #{data}"
    server_socket.send("Msg Recebida!", 0, address[3], address[1])
  end
end

if __FILE__ == $0
  HOST = 'localhost'
  PORT = 6000
  start_server(HOST, PORT)
end