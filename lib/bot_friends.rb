require_relative "./bot_login"

client = twitter_login

names = ["hazrian4","tristanmorin14","guillaume3_7_13"]


names.each {
  | n |
  puts client.update("@#{n} 🤖 un autre test ...")
  client.follow(n)
}
