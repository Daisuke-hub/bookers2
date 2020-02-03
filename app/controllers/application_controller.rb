class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
        # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])

        # added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
        # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def after_sign_in_path_for(resource)
        user_path(current_user.id) # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
        root_path # ログアウト後に遷移するpathを設定
    end

end