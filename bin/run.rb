require_relative "../config/environment"
#require_relative '../db/migrate/seeds.rb'
#require_relative '../lib/api_communicator.rb'
#require_relative '../lib/command_line.rb'
require_relative "./cli.rb"
require 'pry'

#@client = Marvel::Client.new

#@client.configure do |config|
##  config.private_key = '2a5664edbaf064f9528f8edaab81319ef84f6d73'
#end

cli = CLI.new
binding.pry
cli.welcome
#cli.menu
#character = characters

#  puts "HELLO WORLD"
