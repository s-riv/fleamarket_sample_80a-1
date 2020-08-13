class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ancestry
  protect_from_forgery with: :exception
  before_action :set_ancestry

  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
          keys: [:nickname,  :birthday, :first_name,
                 :last_name, :first_name_kana, :last_name_kana,])
  end

  def set_ancestry
    @parent_categories = Category.where(ancestry: nil)
  end


  def production?
    Rails.env.production?
  end

  def set_ancestry
    @parent_categories = Category.where(ancestry: nil)
  end

end
