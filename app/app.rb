require 'rubygems'
require 'bundler'

Bundler.require(:default)

include Mongo

configure do
  db = Mongo::Client.new([ '192.168.60.106:27017'], :database => 'devops')
  set :mongo_db, db[:devops_quotes]
end

get '/' do
  content_type :json
  random_num = rand(1..10).to_i
  quote = settings.mongo_db.find().limit(-1).skip(random_num)
  quote.to_json
end
