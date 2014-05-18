class AddRetweetIdToRetweets < ActiveRecord::Migration
  def change
    add_column :retweets, :retweet_id, :integer, limit: 8
  end
end
