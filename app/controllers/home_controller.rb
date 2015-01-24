class HomeController < ApplicationController
  def show
    if current_user
      @favorite_ids = current_user.favorites
      @favorites = []
      @favorite_ids.each do |favorite|
        @favorites << favorite.tweet_id
      end
      @retweet_ids = current_user.retweets
      @retweets = []
      @retweet_ids.each do |retweet|
        @retweets << retweet.tweet_id
      end
    end
    @banned = Banned.all
    @banned_tweets = []
    @banned.each do |banned|
      @banned_tweets << banned.tweet_id
    end
    @tweets = $twitter.search("#WeHearNebraska -RT", :count => "20")
  end
  
  def sent
    if current_user
      @favorite_ids = current_user.favorites
      @favorites = []
      @favorite_ids.each do |favorite|
        @favorites << favorite.tweet_id
      end
      @retweet_ids = current_user.retweets
      @retweets = []
      @retweet_ids.each do |retweet|
        @retweets << retweet.tweet_id
      end
    end
    @banned = Banned.all
    @banned_tweets = []
    @banned.each do |banned|
      @banned_tweets << banned.tweet_id
    end
    @tweets = $twitter.search("#WeHearNebraska -RT", :count => "20")
  end
end
