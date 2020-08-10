class ItemsController < ApplicationController
  def index
    @products = Product.all.limit(5)
    @parents = Category.all.order("id ASC").limit(4)
    @images = Image.find(1)
  end
end
