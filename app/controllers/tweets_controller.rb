class TweetsController < ApplicationController
  def new
  end
 
  def create
    respond_to do |format|
      if current_user
        if twitter_params[:message].length > 69 && twitter_params[:message].length < 140
          current_user.tweet(twitter_params[:message])
          format.html { redirect_to :sent }
        else
          format.html { redirect_to :root }
        end
      else
        format.html { redirect_to :sent }
      end
    end
  end
 
  def twitter_params
    params.require(:tweet).permit(:message)
  end
  
  def retweet_this
    tweet_id = params[:tweet_id]
    current_user.retweet(tweet_id)
    @tweets = current_user.user_timeline(current_user)
    retweet_id = @tweets.first.id.to_s
    retweet = Retweet.new({
      :tweet_id => tweet_id,
      :retweet_id => retweet_id,
      :user_id => current_user.id
    })
    retweet.save
    
    redirect_to :root
  end
  
  def unretweet_this
    tweet = params[:tweet_id]
    retweet = Retweet.find_by_tweet_id(tweet)
    current_user.unretweet(retweet.retweet_id)
    retweet.destroy
    redirect_to :root
  end
  
  def favorite_this
    tweet = params[:tweet_id]
    favorite = Favorite.new({
      :tweet_id => tweet,
      :user_id => current_user.id
    })
    favorite.save
    
    current_user.favorite(tweet)
    redirect_to :root
  end
  
  def unfavorite_this
    tweet = params[:tweet_id]
    favorite = Favorite.find_by_tweet_id(tweet)
    favorite.destroy
    current_user.unfavorite(tweet)
    redirect_to :root
  end
end
