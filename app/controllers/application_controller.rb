class ApplicationController < ActionController::Base
    skip_forgery_protection

    def current_user
        Current.user ||= authenticate_user_from_session
    end

    def authenticate_user_from_session
        User.find_by(id: cookies[:user_id])
    end

    helper_method :current_user

    def user_signed_in?
        current_user.present?
    end

    helper_method :user_signed_in?
    
    def login(user)
        Current.user = user
        cookies[:user_id] = { 
            same_site: "None"
          }
          cookies[:user_name] = { 
            same_site: "None"
          }
        cookies[:user_id] = user.id
        cookies[:user_name] = user.first_name
        current_user = Current.user
    end

    def logout(user)
        cookies.delete :user_id
    end
end
