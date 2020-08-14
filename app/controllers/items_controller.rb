class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy, :edit, :update, :purchase, :payment]
  
  def index
    @products = Product.all.includes(:images).limit(5)
  end

end
