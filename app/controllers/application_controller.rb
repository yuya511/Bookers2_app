class ApplicationController < ActionController::Base
  #deviseの処理を書く場合、:configure_permitted_parametersを使ってね
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end
end