class Retweet < ActiveRecord::Base
  attr_accessible :tweet_id, :user_id, :retweet_id
  
  belongs_to :user
end
