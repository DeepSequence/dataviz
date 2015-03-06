class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :is_admin?


  def authorize_admin
    unless is_admin?
      redirect_to root_url, notice: "Must be admin"
    end
  end
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def is_admin?
    current_user && (current_user.uid == "18310167")
  end
  #helper_method :current_user
end
