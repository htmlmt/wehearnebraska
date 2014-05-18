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
    @hashtags = $twitter.search("#WeHearNebraska")
    @tweets = []
    @hashtags.each do |hashtag|
      if hashtag.favorite_count > 0
        @tweets << hashtag
      end
    end
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
    @hashtags = $twitter.search("#WeHearNebraska")
    @tweets = []
    @hashtags.each do |hashtag|
      if hashtag.favorite_count > 0
        @tweets << hashtag
      end
    end
  end
end
