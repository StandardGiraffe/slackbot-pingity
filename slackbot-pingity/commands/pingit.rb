module SlackbotPingity
  module Commands
    class Pingit < SlackRubyBot::Commands::Base
      command 'pingit' do |client, data, _match|
        client.say(channel: data.channel, text: "But---I don't know how yet!")
      end
    end
  end
end
