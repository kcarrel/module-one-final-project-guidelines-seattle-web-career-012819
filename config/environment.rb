require 'bundler'
Bundler.require
require_all 'app'
require_rel '../bin/cli.rb'

ActiveRecord::Base.logger = nil
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

@client = Marvel::Client.new
key_hash = YAML::load(File.open('config/secrets.yml'))

@client.configure do |config|
 config.api_key = key_hash["api_key"]
 config.private_key = key_hash["private_key"]
end
