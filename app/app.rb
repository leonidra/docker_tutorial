require 'rubygems'
require 'bundler'

Bundler.require(:default)

include Mongo

set :bind, '0.0.0.0'
set :port, 9292

configure do
  if ENV['DOCKER_ENV'].nil?
    host = ENV["VBOX_IP"] || "localhost"
  else
    host = 'db'
  end

  database = 'devops'
  coll = 'devops_quotes'

  db = Mongo::Client.new([ "#{host}:27017"], :database => database)
  set :mongo_db, db[coll]
end

get '/' do
  content_type :json

  random_num = rand(1..settings.mongo_db.find().count).to_i
  quote = settings.mongo_db.find().limit(-1).skip(random_num).to_a.first

  if quote.nil?
    response = { :error => "No quotes found"}
  else
    quote['id'] = quote['_id'].to_s
    response = { :id => quote['id'], :quote => quote[:quote] }
  end

  response.to_json
end
