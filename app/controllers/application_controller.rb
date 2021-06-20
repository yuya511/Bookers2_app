class ApplicationController < ActionController::Base
  #ログインしていないときは、ログイン画面に遷移する
  before_action :authenticate_user!,except: [:top, :about]
  #deviseの処理を書く場合、:configure_permitted_parametersを使ってね
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource)
    flash[:notice] = "successfully"
    user_path(current_user.id)
  end
  
  #ログアウト後に遷移する画面
  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully"
    root_path
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end
end