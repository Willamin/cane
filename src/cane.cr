require "stout"
require "./monkey"

module Cane
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end

server = Stout::Server.new

server.get("/") do |context|
  context << Stout::Magic.ecrs("src/index.html.ecr")
end

server.get("/cane") do |context|
  context.response.status_code = 200
  puts "connection from: #{context.response.remote_address}"
end

server.listen
