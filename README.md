# Cat Factor Messenger

Text or tweet a random cat fact to your friends.

## Setup

This Ruby on Rails app uses  

The app uses Ruby 2.3.1, Rails 5, and Postgres 9.5.2 as the database.

1. git clone
2. bundle install
3. rake db:setup
4. create the .env file and populate it with your twilio and twitter auth with the variables: TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET, TWITTER_ACCESS_TOKEN, TWITTER_ACCESS_TOKEN_SECRET
5. rails server
6. then visit localhost:3000
