class CardsController < ApplicationController
  require_relative './../commonclass/payjp.rb'
  before_action :set_card

  def index
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def new 
    card = Card.where(user_id: current_user.id).first
    redirect_to root_path if card.present?
  end

  def create 
    if params['payjp-token'].blank?
<<<<<<< Updated upstream
      redirect_to action: :new
=======
      redirect_to action: "new"
>>>>>>> Stashed changes
    else
      customer = Payjp::Customer.create(
        description: 'test', 
        email: current_user.email,
        card: params['payjp-token'], 
        metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
<<<<<<< Updated upstream
        redirect_to action: :index
=======
        redirect_to root_path
>>>>>>> Stashed changes
      else
        redirect_to action: :new
      end
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: :new, notice: "削除しました"
    else
      redirect_to action: :index, alert: "削除できませんでした"
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end


end

