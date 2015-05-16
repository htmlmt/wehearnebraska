class HomeController < ApplicationController
  def show
    names = ["St. Vincent", "The Avett Brothers"]
    photos = ["st-vincent.jpg", "avett-brothers.jpg"]
    if current_user
      if current_user.name == "Hear Nebraska"
        @tweets = Post.order("created_at DESC")
      else
        @tweets = Post.where(approved: true).order("created_at DESC")
      end
    else
      @tweets = Post.where(approved: true).order("created_at DESC")
    end
    rand = rand(0..1)
    @name = names[rand]
    @photo = photos[rand]
  end
  
  def sent
    if current_user
      if current_user.name == "Hear Nebraska"
        @tweets = Post.all
      else
        @tweets = Post.all
      end
    else
      @tweets = Post.all
    end
  end
end
