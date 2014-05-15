class HomeController < ApplicationController
  def show
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
