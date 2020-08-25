class ContractsController < ApplicationController
  require_relative './../commonclass/payjp.rb'
  before_action :set_card, only: [:show]
  before_action :set_product
  require "payjp"

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
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
