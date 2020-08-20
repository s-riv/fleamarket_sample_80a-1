class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show]
  before_action :return_to_top, except: [:index, :show]
 

  def index
  end

  def show
    @small = @product.category
    @midium = @small.parent
    @large = @midium.parent
    @image = @product.images.limit(1)
    @images = @product.images
    @products = Product.all.includes(:images).limit(5)
    @user = @product.user
    @address = @product.prefecture
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if params[:product][:images_attributes] && @product.save
      redirect_to root_path, notice: "商品を出品しました"
    else
      @product.images.new
      render :new
    end
  end


  def edit
  end

  def update
    if params[:product][:images_attributes] && @product.update(edit_product_params)
      redirect_to root_path, notice: "商品情報を編集しました"
    else
      render :edit
    end
  end


  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path, notice: "商品を削除しました"
    else
      render :show
    end
  end
  
  def mid_category
    @mid_categories = Category.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

  def small_category
    @small_categories = Category.where(ancestry: "#{params[:big_category_id]}/#{params[:mid_category_id]}")
    render json: @small_categories
  end

  private
  def product_params
    params.require(:product)
      .permit(:name, :description, :price, :condition, :brand, :send_price,
              :ship_day, :category_id, :prefecture_id, images_attributes: [:image])
      .merge(user_id: current_user.id, status: 0)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def edit_product_params
    params.require(:product).permit(:name, :description, :price, :condition, :brand, :send_price, :ship_day, :category_id, :prefecture_id, images_attributes: [:image, :_destroy, :id])
  end

  def return_to_top
    unless user_signed_in?
      redirect_to root_path, alert: "ログインしてください"
    end
  end


end
