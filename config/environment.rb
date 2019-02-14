require 'bundler'
Bundler.require
require_rel ('../app')
require_rel ('../lib')
# require_all ('bin')
#require_rel ()

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
#require_all 'lib'

@client = Marvel::Client.new
key_hash = YAML::load(File.open('config/secrets.yml'))

@client.configure do |config|
 config.api_key = key_hash["api_key"]
 config.private_key = key_hash["private_key"]
end
