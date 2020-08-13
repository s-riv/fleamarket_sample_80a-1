class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy, :edit, :update, :purchase, :payment]
  
  def index
    @products = Product.all.includes(:images).limit(5)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    

end
