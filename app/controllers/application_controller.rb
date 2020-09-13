class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: 
      [ :nickname, :family_name, :family_name_kana, :user_name,
        :user_name_kana, :birthday, :sex, :image, :postal_code, :prefectures,
        :municipality, :address, :apartment_room_namber, :phone_number])
    # deviseでは初期状態でサインアップ時にメールアドレスとパスワードのみを
    # 受け取るようにストロングパラメーターが設定してあるので、追加したキーの
    # パラメーターを許可されていません。
    # 追加のパラメーターを許可したい場合は、applicaiton_controller.rbに
    # before_actionにconfigure_permitted_parametersメソッドを設定する。
  end
end
