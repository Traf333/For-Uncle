class SessionsController < ApplicationController

  def new
    
  end

  def create
    seller = Seller.find_by_name(params[:session][:name])
    if seller && seller.authenticate(params[:session][:password])
      sign_in seller
      redirect_to seller
    else
      flash.now[:error] = "Invalid"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
