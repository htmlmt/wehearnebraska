class Post < ActiveRecord::Base
  attr_accessible :full_name, :photo, :text, :username, :approved
end
