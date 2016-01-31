require 'rubygems'
require 'bundler'

Bundler.require(:default)

include Mongo

configure do
  host = ENV["VBOX_IP"] || "localhost"
  database = 'devops'
  coll = 'devops_quotes'

  db = Mongo::Client.new([ "#{host}:27017"], :database => database)
  set :mongo_db, db[coll]
end

get '/' do
  content_type :json

  random_num = rand(1..settings.mongo_db.find().count).to_i
  quote = settings.mongo_db.find().limit(-1).skip(random_num).to_a.first

  quote['id'] = quote['_id'].to_s
  { :id => quote['id'], :quote => quote[:quote] }.to_json
end
