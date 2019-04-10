require_relative "./bot_login"

client = twitter_login # connection

#client.update("@the_hacking_pro #tweet_ception Bienvenue dans la 🤪tweetception #bonjour_monde")


tweet_ception = client.search("#bonjour_monde #tweet_ception", result_type: "recent").take(1).collect.next

puts tweet_ception.user.screen_name
puts tweet_ception.text
puts client.oembed(tweet_ception).html
sleep 1

raise "stop"

puts "---starting to follow"

search = client.search("#bonjour_monde", result_type: "recent").collect
puts "§§§-popular request send"

count = 0
while followed.length < 100 && count<1000#tant qu'on a pas 100 noms
  begin
    tweet = search.next #s'il reste des tweets dans le collect
  rescue #sinon on relance une requete
    search = client.search("#bonjour_monde", result_type: "recent").collect
    puts "§§§-new request sent"
    tweet = search.next
  end
  user = tweet.user.screen_name.to_s #pour n'envoyer qu'une requete
  puts "testing #{user}"
  unless followed.include?(user) || user == "guillaume3_7_13"
    followed << user
    client.follow(user)
    puts "followed #{user} - #{followed.length}/21"
  else
    puts "#{user} already followed"
  end
  sleep 1
  count += 1
end
