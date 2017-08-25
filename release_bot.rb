require 'slack-ruby-bot'
require 'net/http'

class ReleaseBot < SlackRubyBot::Bot

  help do
    title 'ReleaseBot'
    desc 'Gets the current release branch for STAGE and PRODUCTION envs'

    command 'get_releases' do
      desc 'Shows the name for STG and PRD release branches'
      long_desc 'Shows the name for STG and PRD release branches. Getting the names from the STG-Deploy and PRD-Deploy console outputs. Usage: `get_releases`'
    end
  end

  command 'get_releases' do |client, data, match|
    response = HTTParty.get('http://api/1/misc/current_releases')
    client.say(text: response.body || "We couldn't connect to the server", channel: data.channel)
  end
end

ReleaseBot.run
