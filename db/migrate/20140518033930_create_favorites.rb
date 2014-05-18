class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :tweet_id, limit: 8

      t.timestamps
    end
  end
end
