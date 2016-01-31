#require 'rubygems'
#require 'bundler'

#Bundler.require(:default)

require 'mongo'
include Mongo

devops_quotes = [
  "Some day you will die and all of this will be someone else's problem",
  "now seems like a good time to remind you of your mortality",
  "i can't write the errors to disk as fast as you're creating them",
  "what's your favorite server monitoring tool and why is it users?",
  "You can't please all the people all the time. You can however displease all the people all the time.",
  "Marking alert emails as spam doesn't make them go away.",
  "Just address the disk space alert and I'll let you get back to being miserable.",
  "Sending you an error email failed because your mbox is full of error emails.",
  "continuous delivery of downtime",
  "Amazon's new Elastic Downtime saves time by taking apps offline so your developers don't have to.",
  "Quorum is when all the nodes in the cluster agree that this is a terrible idea"
]

devops_quotes.each do |df|
  host = ENV["VBOX_IP"] || "localhost"
  client = Mongo::Client.new([ "#{host}:27017" ], :database => 'devops')
  client[:devops_quotes].insert_one({ quote: df })
end
