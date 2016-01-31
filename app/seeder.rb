require 'rubygems'
require 'bundler'

Bundler.require(:default)

include Mongo

configure do
  db = Mongo::Client.new([ '192.168.60.106:27017'], :database => 'devops')
  set :mongo_db, db[:devops_quotes]
end

devops_quotes = [
  "Some day you will die and all of this will be someone else's problem",
  "now seems like a good time to remind you of your mortality",
  "sadness is not in the destination, but in the journey",
  "i can't write the errors to disk as fast as you're creating them",
  "what's your favorite server monitoring tool and why is it users?",
  "Never underestimate the disappointment of a station wagon full of corrupted backup tapes hurtling down the highway.",
  "You can't please all the people all the time. You can however displease all the people all the time.",
  "Marking alert emails as spam doesn't make them go away.",
  "Just address the disk space alert and I'll let you get back to being miserable.",
  "Sending you an error email failed because your mbox is full of error emails."
]

devops_quotes.each do |df|
  client = Mongo::Client.new([ '192.168.60.106:27017'], :database => 'devops')
  client[:devops_quotes].insert_one({ quote: df })
end
