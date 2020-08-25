class ContractsController < ApplicationController
  require_relative './../commonclass/payjp.rb'
  before_action :set_product
  before_action :check_collect_user
  before_action :exclusion_bought_product

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(user_id:   current_user.id,
                            product_id:  @product.id
                           )
    if @contract.save
      MyPayjp.create_charge_by_token(current_user.card.customer_id,
                                    @product.price)
      @product.update(status: 1)
      redirect_to root_path, notice: "購入が完了しました"
    else
      render :new
    end
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def check_collect_user
    if @product.user_id == current_user.id
      redirect_to root_path, alert: "ご自身で出品された商品です"
    end
  end

  def exclusion_bought_product
     unless @product.status == 0
      redirect_to root_path, alert: "この商品は売切れです"
    end
  end


end
