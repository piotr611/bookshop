class StoreController < ApplicationController
  def index  	
  	@counter = increment_count
  	@products = Product.order(:title)
  end

  def increment_count
  	session[:counter] ||= 0
  	session[:counter] += 1  	
  end
end
