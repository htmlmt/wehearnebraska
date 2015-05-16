class HomeController < ApplicationController
  def show
    if current_user
      if current_user.name == "Hear Nebraska"
        @tweets = Post.order("created_at DESC")
      else
        @tweets = Post.where(approved: true).order("created_at DESC")
      end
    else
      @tweets = Post.where(approved: true).order("created_at DESC")
    end
  end
  
  def sent
    if current_user
      if current_user.name == "Hear Nebraska"
        @tweets = Post.order("created_at DESC")
      else
        @tweets = Post.where(approved: true).order("created_at DESC")
      end
    else
      @tweets = Post.where(approved: true).order("created_at DESC")
    end
  end
end
