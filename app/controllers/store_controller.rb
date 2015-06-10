class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index  	
  	@counter = increment_count
  	@products = Product.order(:title)
  end

  def increment_count
  	session[:counter] ||= 0
  	session[:counter] += 1  	
  end
end
