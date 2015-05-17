class TweetsController < ApplicationController
  def new
  end
 
  def create
    respond_to do |format|
      if current_user
        message = twitter_params[:band] + ' ' + twitter_params[:message]
        begin
          current_user.tweet(message)
        rescue
          flash[:notice] = "Your tweet could not be sent. Was it too long perhaps? Please try again."
          format.html { redirect_to :root }
        end
        @post = Post.new(text: message, username: current_user.username, full_name: current_user.name, photo: current_user.photo)
        if @post.save
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
    params.require(:tweet).permit(:message, :band)
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
    
    @tweet = tweet_id
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end
  
  def unretweet_this
    tweet = params[:tweet_id]
    @retweet_id = Retweet.find_by_tweet_id(tweet).retweet_id
    @retweet = Retweet.find_by_tweet_id(tweet)
    current_user.unretweet(@retweet_id)
    
    @tweet = tweet
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
        @retweet.destroy
    end
  end
  
  def ban
    tweet = params[:tweet_id]
    banned = Banned.new({
      :tweet_id => tweet
    })
    banned.save
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end
  
  def favorite_this
    tweet = params[:tweet_id]
    favorite = Favorite.new({
      :tweet_id => tweet,
      :user_id => current_user.id
    })
    favorite.save
    
    current_user.favorite(tweet)
    
    @tweet = tweet
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end
  
  def unfavorite_this
    tweet = params[:tweet_id]
    favorite = Favorite.find_by_tweet_id(tweet)
    favorite.destroy
    
    current_user.unfavorite(tweet)
    
    @tweet = tweet
    
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end
end
