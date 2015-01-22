class HomeController < ApplicationController
  def index
    Impression.hit
    
    @data = {:time => Time.now, :hits => Impression.total}
  end
end
