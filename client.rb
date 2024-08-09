require 'socket'

def start_server(address, port)
  client_server = UDPSocket.new

  loop do
    print 'Digite sua mensagem: '
    message = gets.chomp
    client_server.send(message, 0, address, port)
    data, _ = client_server.recvfrom(1024)
    puts "Mensagem direto do servidor: #{data}"
  end
end

if __FILE__ == $0
  HOST = 'localhost'
  PORT = 6000

  start_server(HOST, PORT)
end
