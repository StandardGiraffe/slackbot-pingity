require 'sinatra/base'

module SlackbotPingity
  class Web < Sinatra::Base
    get '/' do
      'Ping all the things!'
    end
  end
end
