class UsersController < ApplicationController
  

  def show
    @exhibitions = current_user.products.where(status: 0).last(4)
    @contracts = current_user.contracts.last(4)
  end


  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user.id), notice: "本人情報を更新しました"
  end

  private

    params.require(:user).permit(:nickname, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday).merge(password: current_user.password)
  end


end
