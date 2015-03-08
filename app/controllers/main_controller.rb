class MainController < ApplicationController
  def index
  end

  def admin
    
  end

  def about
    if params[:layout]
      render :about, :layout => false
    else
      render :about
    end
  end
end
