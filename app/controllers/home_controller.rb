class HomeController < ApplicationController
  def show
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
    @hashtags = $twitter.search("#WeHearNebraska").take(30)
    @tweets = []
    @hashtags.each do |hashtag|
      if hashtag.favorite_count > 0
        @tweets << hashtag
      end
    end
  end
  
  def sent
    @hashtags = $twitter.search("#WeHearNebraska").take(30)
    @tweets = []
    @hashtags.each do |hashtag|
      if hashtag.favorite_count > 0
        @tweets << hashtag
      end
    end
  end
end
