#!/usr/bin/env ruby
WORK_DIR=File.expand_path(__FILE__).sub(/[^\/]+$/,'')
require WORK_DIR + './Class/TetesolTwitter.rb'
tweet_user = TetesolTwitter.new
#最後に取得したツイートid取得
last_tweet_id = "1"
args = ARGV
case args.length
when 0
  if File.exist? (WORK_DIR + "/config/.last_tweet_id")
    File.open(WORK_DIR + "/config/.last_tweet_id","r") do |file|
      file.each do |line|
        last_tweet_id = "#{line.chomp}"
      end
    end
  else
    File.open(WORK_DIR + "/config/.last_tweet_id","w")
  end
  timeline = tweet_user.home_timeline( last_tweet_id )
  last_tweet_id = tweet_user.tweetPrintConsole(timeline, last_tweet_id) #見え方悪いけど合理的　直す？
  File.open(WORK_DIR + "/config/.last_tweet_id","r+") do |file|
    file.puts(last_tweet_id)
  end
when 1..2
#args.find('@')
  puts "wait a little..."
  exit
else
  puts "too many args!"
  exit
end
