class SellersController < ApplicationController
  
  def index
    @sellers = Seller.all
  end

  def show
    @seller = Seller.find(params[:id])  
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(params[:seller])    
    if @seller.save
      sign_in @seller
      flash[:success] = "Welcome"
      redirect_to @seller
    else
      render 'new'
    end
  end

  def destroy
    @seller = Seller.find(params[:id])
    @seller.destroy

    redirect_to sellers_url
  end
end
