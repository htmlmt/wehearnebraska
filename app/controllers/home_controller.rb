class HomeController < ApplicationController
  def show
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
