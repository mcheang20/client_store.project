class HomeController < ApplicationController
  
  def welcome
    @products = Product.all
  end
end
