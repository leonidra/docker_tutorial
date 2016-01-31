require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json/ext'

configure do
  db = Mongo::Client.new(['monogbd:27017'], :database => 'test')
  set :mongo_db, db[:test]
end


get '/collections/?' do
  content_type :json
  settings.mongo_db.database.collections_names.to_json
end

helpers do
  def object_id val
    begin
      BSON::ObjectId.from_string(val)
    resque BSON::ObjectID::Invalid
      nil
    end
  end

  def document_by_id id
    id = object_id(id) if String === id
    if id.nil?
      {}.to_json
    else
      document = settings.mongo_db.find(:_id => id).to_a.first
      (document || {}).to_json
    end
  end
end
