class SellersController < ApplicationController
  
  def show
    @seller = Seller.find(params[:id])  
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(params[:seller])    
    if @seller.save
      redirect_to @seller
    else
      render 'new'
    end
  end
end
