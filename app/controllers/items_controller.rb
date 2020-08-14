class ItemsController < ApplicationController
  def index
    @products = Product.all.includes(:images).limit(5)
  end

  def edit
  end
end
