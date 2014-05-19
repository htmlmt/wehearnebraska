class CreateBanneds < ActiveRecord::Migration
  def change
    create_table :banneds do |t|
      t.integer :tweet_id, limit: 8

      t.timestamps
    end
  end
end
