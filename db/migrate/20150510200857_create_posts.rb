class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text
      t.string :username
      t.string :full_name
      t.string :photo

      t.timestamps
    end
  end
end
