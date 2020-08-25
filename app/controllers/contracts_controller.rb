class ContractsController < ApplicationController
  require_relative './../commonclass/payjp.rb'
  before_action :set_card, only: [:show, :new]
  before_action :set_product
  before_action :check_collect_user

  before_action :exclusion_bought_product


  def new
    @contract = Contract.new
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    @contract = Contract.new(user_id:   current_user.id,
                            product_id:  @product.id
                           )
    if @contract.save
      MyPayjp.create_charge_by_token(current_user.card.customer_id,
                                    @product.price)
      @product.update(status: 1)
      render :show, notice: "購入が完了しました"
    else
      render :new
    end
  end

  def show
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end


  def check_collect_user
    if @product.user_id == current_user.id
      redirect_to root_path, alert: "ご自身で出品された商品です"
    end
  end

  def exclusion_bought_product
    if @product.status == 0
      redirect_to root_path, alert: "この商品は売切れです"
    end
  end

end
