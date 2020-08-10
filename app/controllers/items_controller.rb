class ItemsController < ApplicationController
  def index
    @products = Product.all.limit(5)
    @parents = Category.all.order("id ASC").limit(13)
  end
end
