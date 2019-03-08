require 'slack-ruby-bot'
require 'slack-ruby-client'
# require 'slackbot-pingity/commands/ping'
require 'slackbot-pingity/routing/ping'
require 'slackbot-pingity/bot'
require 'slack-notifier'
require 'pingity'

notifier = Slack::Notifier.new(
  ENV['SLACK_WEBHOOK_URL']
)

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

@client = Slack::RealTime::Client.new

@client.on :hello do
  puts "Successfully connected, welcome '#{@client.self.name}' to the '#{@client.team.name}' team at https://#{@client.team.domain}.slack.com."
end

# Message routing
@client.on :message do |data|
  puts data

  case data.text
  when /^ping/i
    ping_resource(data)
  end
end

@client.start!

