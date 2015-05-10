class User < ActiveRecord::Base
  require 'twitter-text'
  include Twitter::Autolink
  include Twitter::Extractor
  
  attr_accessible :name, :oauth_secret, :oauth_token, :provider, :uid
  
  has_many :favorites
  has_many :retweets
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.photo = auth.info.image
      user.username = auth.info.nickname
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.save!
    end
  end
 
  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.update(tweet)
  end
  
  def user_timeline(user)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.user_timeline(user, options = {:include_rts => true})
  end
  
  def retweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.retweet(tweet)
  end
  
  def unretweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.destroy_status(tweet)
  end
  
  def favorite(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.favorite(tweet)
  end
  
  def unfavorite(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.unfavorite(tweet)
  end
  
end
