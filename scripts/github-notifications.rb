#!/usr/bin/env ruby

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Reviews and Mentions (rb)
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.iconDark images/github-logo-iconDark.png

require 'json'
require 'net/http'
require 'uri'

API_TOKEN = ENV["GH_TOKEN"]

if API_TOKEN.nil? || API_TOKEN.empty?
  puts 'No API token provided'
  exit(1)
end

RED = 31
GREEN = 32
YELLOW = 33

uri = URI('https://api.github.com/notifications')
req = Net::HTTP::Get.new(uri)
req['Authorization'] = "bearer #{API_TOKEN}"
req_options = {
  use_ssl: uri.scheme == 'https'
}

res = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(req)
end

if res.code == '200'
  notifications = JSON.parse(res.body)
  reviews = []

  unless notifications.length > 0
    message = "You've reached zero inbox! 🍺"
    puts "\e[#{GREEN}m#{message}\e[0m"
    exit(1)
  else
    notifications.each do |pr|
      if (pr['reason'] == 'review_requested') || (pr['reason'] == 'comment') || (pr['reason'] == 'mention')
        reviews.push(pr)
      end
    end
    
    unless reviews.length > 0
      message = "You have 0 open tasks 🙌🏼"
      puts "\e[#{GREEN}m#{message}\e[0m"
      exit(1)
    else
      color = (reviews.length <= 5) ? YELLOW : RED
      message = "You have #{reviews.length} open tasks"
      puts "\e[#{color}m#{message}\e[0m"
    end
    
    reviews.each do |pr|
      pr_number = /[0-9]+/.match(pr['subject']['url'])[0]
      puts "\e[#{YELLOW}m#{pr['repository']['name']}\e[0m (#{pr['reason']}) \n→  #{pr['subject']['title']}\n(https://github.com/heyjobs/#{pr['repository']['name']}/pull/#{pr_number})"
    end
  end
else
  puts 'Failed loading GitHub notifications'
  exit(1)
end