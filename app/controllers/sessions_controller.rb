class SessionsController < ApplicationController

  def create
    @user= User.where(provider: auth_hash[:provider], name: auth_hash[:info][:name], uid: auth_hash[:uid]).first_or_create
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end

protected

def auth_hash
  request.env['omniauth.auth']
end

end