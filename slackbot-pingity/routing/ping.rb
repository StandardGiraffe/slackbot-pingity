def ping_resource(data)
  request = process_input(data.text)

  @client.web_client.chat_postMessage(
    as_user: true,
    channel: data.channel,
    text: "I'm attempting to ping \"#{request}\" for <@#{data.user}>.\nJust a moment, please..."
  )

  report = Pingity::Report.new(
    request,
    eager: true
  )

  status = report.status
  target = report.target
  timestamp = report.timestamp.to_s
  image_url = get_status_image(status: status, target: target)[:url]
  alt_text = get_status_image(status: status, target: target)[:alt_text]

  puts "######################"
  puts "So far, so good..."
  puts "######################"

  @client.web_client.chat_postMessage(
    as_user: true,
    channel: data.channel,
    text: "It didn't work, dummy!",
    blocks: [
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "*<https://pingity.com|Pingty> has your results for #{target}*"
        }
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "*Overall Status:*\n#{status}\n*Current as of:*\n#{timestamp}"
        },
        "accessory": {
          "type": "image",
          "image_url": get_status_image(status: status, target: target)[:url],
          "alt_text": get_status_image(status: status, target: target)[:alt_text]
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "emoji": true,
              "text": "Details on Pingity.com"
            },
            "value": "details_on_pingity"
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "emoji": true,
              "text": "Refresh Result"
            },
            "value": "retest"
          }
        ]
      }
    ]
  )
end

def process_input(input)
  input = input.split[1].downcase
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

def get_status_image(status:, target:)
  case status
  when "pass"
    {url: "https://www.tutorialspoint.com/ruby/images/ruby-mini-logo.jpg", alt_text: "#{target} is passing" }
  when "warning"
    {url: "https://www.tutorialspoint.com/ruby/images/ruby-mini-logo.jpg", alt_text: "#{target} is raising warnings" }
  when "fail_critical"
    {url: "https://www.tutorialspoint.com/ruby/images/ruby-mini-logo.jpg", alt_text: "#{target} is failing" }
  else
    {url: "https://www.tutorialspoint.com/ruby/images/ruby-mini-logo.jpg", alt_text: "#{target} is inconclusive for some reason..." }
  end
end
