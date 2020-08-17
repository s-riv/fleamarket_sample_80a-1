class UsersController < ApplicationController
  def show
    @exhibitions = current_user.products.where(status: 0).limit(4)
    @contracts = current_user.contracts.limit(4)
  end
end
