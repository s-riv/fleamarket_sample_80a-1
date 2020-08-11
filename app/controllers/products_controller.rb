class ProductsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if params[:product][:images_attributes] && @product.save
      redirect_to root_path
    else
      @product.images.new
      render :new
    end
  end


  def pay
    @product = Product.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @product.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end
  
  def edit
  end

  def update
  end

  def destroy
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
      .merge(status: 0)
  end

end
