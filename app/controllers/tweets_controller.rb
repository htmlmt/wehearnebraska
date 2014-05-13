class TweetsController < ApplicationController
  def new
  end
 
  def create
    respond_to do |format|
      if current_user
        current_user.tweet(twitter_params[:message])
        format.html { redirect_to :root, notice: 'Tweet sent.' }
      else
        format.html { redirect_to :root }
      end
    end
  end
 
  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
