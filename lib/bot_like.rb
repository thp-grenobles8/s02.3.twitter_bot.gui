require_relative "./bot_login"

client = twitter_login # connection

client.search("#bonjour_monde", result_type: "recent").collect do
  |tweet|
  # puts "#{tweet.user.screen_name}: #{tweet.text}"
  # client.like(tweet)
  # puts tweet.methods
  client.favorite(tweet)
end
