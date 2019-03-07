module SlackbotPingity
  class Bot < SlackRubyBot::Bot
    match /^\/ping (?<resource>\w*)$/i do |client, data, match|
      client.say(
        channel: data.channel,
        text: "You attempted to ping #{match[:resource]}.  Good for you!"
      )
    end
  end
end
