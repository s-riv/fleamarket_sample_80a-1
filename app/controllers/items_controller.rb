class ItemsController < ApplicationController
  def index
    @products = Product.all.includes(:images).limit(5)
  end
end
