class SellersController < ApplicationController
  
  before_filter :signed_in_seller, only: [:edit, :update]
  before_filter :correct_seller,   only: [:edit, :update]

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

  def edit
    @seller = Seller.find(params[:id])
  end

  def update
    @seller = Seller.find(params[:id])
    if @seller.update_attributes(params[:seller])
      sign_in @seller
      flash[:success] = "Profile updated"
      redirect_to @seller
    else
      render 'edit'
    end
  end

  def destroy
    @seller = Seller.find(params[:id])
    @seller.destroy

    redirect_to sellers_url
  end

  private

    def signed_in_seller
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

    def correct_seller
      @seller = Seller.find(params[:id])
      redirect_to root_path unless current_seller?(@seller)
    end
end
