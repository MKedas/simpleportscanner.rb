require 'socket'		#require the socket library


def open_port(host, port)								# Host IP, port number
	sock = Socket.new( :INET, :STREAM)					#creates TCP Socket object
	sString = Socket.sockaddr_in(port, host)			#returns the host and port as a sockaddr string
	puts "Port #{port} open." if sock.connect(sString)	#puts open if you can connect to port

rescue (Errno::ECONNREFUSED)	#EXCEPTION: port not listening for connections
# puts "Port #{port} not listening for connections."
rescue (Errno::ETIMEDOUT)		#EXCEPTION: port timed out, this could mean a firewall is filtering that port
# puts "Port #{port} has timed out."
end

def main(host, start_port, end_port)		#function will take the host IP address, start port, end port. 
puts "*_*_*_*_*_* R E S U L T S *_*_*_*_*_*"
		until start_port > end_port do		#until the port 
			open_port(host, start_port)
			start_port += 1
	end
puts "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*"
end
	


main ARGV[0], ARGV[1].to_i, ARGV[2].to_i