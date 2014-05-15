class HomeController < ApplicationController
  def show
    @tweets = $twitter.search("#WeHearNebraska")
  end
  
  def sent
    @tweets = $twitter.search("#WeHearNebraska")
  end
end
