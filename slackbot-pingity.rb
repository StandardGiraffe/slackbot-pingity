require 'slack-ruby-bot'
require 'slackbot-pingity/commands/pingit'
require 'slackbot-pingity/bot'
require 'slack-notifier'

notifier = Slack::Notifier.new(
  ENV['SLACK_WEBHOOK_URL']
  )

