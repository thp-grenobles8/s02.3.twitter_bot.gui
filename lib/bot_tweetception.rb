require_relative "./bot_login"

client = twitter_login # connection

#client.update("@the_hacking_pro #tweet_ception Bienvenue dans la 🤪tweetception #bonjour_monde")


tweet_ception = client.search("#bonjour_monde #tweet_ception", result_type: "recent").take(1).collect.next

puts tweet_ception.user.screen_name
puts tweet_ception.text
id = tweet_ception.id.to_i
sleep 1

puts "press enter to start"
gets.chomp

puts "---starting to search"

search = client.search("#bonjour_monde", result_type: "recent").collect
puts "§§§-popular request send"

ceptionized = []
count = 0
while ceptionized.length < 100 && count<1000#tant qu'on a pas 100 noms
  begin
    tweet = search.next #s'il reste des tweets dans le collect
  rescue #sinon on relance une requete
    search = client.search("#bonjour_monde", result_type: "recent").collect
    puts "§§§-new request sent"
    tweet = search.next
  end
  user = tweet.user.screen_name.to_s #pour n'envoyer qu'une requete
  puts "testing #{user}"
  unless ceptionized.include?(user) || user == "guillaume3_7_13"
    ceptionized << user
    new_tweet = client.update("@#{user} tu as été tweet_ceptionisé!",
      in_reply_to_status_id: id)
    puts "tweet_ceptionized #{user} - #{ceptionized.length}/100"
    id = new_tweet.id.to_i
    puts "#{id} is the new id"
  else
    puts "#{user} already tweet_ceptionized"
  end
  sleep 1
  count += 1
end
