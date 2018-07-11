class HTTP::Server::Response
  # Returns the local address of the network socket used by this connection.
  #
  # This can be useful if the server listens on multiple sockets.
  def local_address : Socket::Address?
    if (socket = @io).responds_to? :local_address
      socket.local_address
    end
  end

  # Returns the remote address of the network socket used by this connection.
  #
  # This is not necessarily the address of the original requestor but the last
  # proxy (e.g. a load balancer).
  def remote_address : Socket::Address?
    if (socket = @io).responds_to? :remote_address
      socket.remote_address
    end
  end
end
