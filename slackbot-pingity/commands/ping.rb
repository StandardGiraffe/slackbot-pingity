module SlackbotPingity
  module Commands
    class Ping < SlackRubyBot::Commands::Base
      command 'ping' do |client, data, match|
        request = self.process_input(match['expression'])
        client.say(
          channel: data.channel,
          text: "I'm attempting to ping \"#{request}\".  Just a moment, please..."
        )

        report = Pingity::Report.new(
          request,
          eager: true
        )

        status = report.status

        client.say(
          channel: data.channel,
          text: "... The Pingity status for \"#{request}\" is \"#{status}\"."
        )
      end

      def self.process_input(input)
        input = input.split[0].downcase
        case input
        when /\|(?<uri>.+)\>$/
          # When slack recognizes a potential URI, it pre-formats it before the
          # data can be extracted with match['expression'], resulting in a
          # characteristic string, "http://<<guessed uri>|<human-readable uri>>".
          # This approach identifies strings that have characters between | and >
          # and extracts them.
          $LAST_MATCH_INFO['uri'][0..-1]
        else
          input
        end
      end
    end
  end
end
