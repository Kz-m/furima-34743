class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_authentication #basic認証の処理

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :family_name, :given_name, :family_name_kana, :given_name_kana,
                                             :date_of_birth])
  end

  def basic_authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["FRMBASIC_AUTHENTICATE_USER"] && password == ENV["FRMBASIC_AUTHENTICATE_PASSWORD"] # vim ~/.zshrcで設定した環境変数userとpassword
    end
  end
end
