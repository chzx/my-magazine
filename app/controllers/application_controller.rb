class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   helper_method :user_signed_in?
   helper_method :current_user


  private
    def user_signed_in?
     session[:user_id].present?
     #why doesnt this work? This is your code ---> current_user.present?
    end

    def current_user
      @current_user = @current_user || User.find(session[:user_id]) if session([:user_id])
    end

end
