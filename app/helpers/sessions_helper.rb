module SessionsHelper

  def sign_in(seller)
    cookies.permanent[:remember_token] = seller.remember_token
    current_seller = seller  
  end

  def signed_in?
    !current_seller.nil?    
  end
  
  def signed_in_seller
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  def feed
    Operation.all
  end
  
  def sign_out
    current_seller = nil
    cookies.delete(:remember_token)
  end
  
  def current_seller=(seller)
    @current_seller = seller
  end

  def current_seller
    @current_seller ||= seller_from_remember_token
  end

  def current_seller?(seller)
    seller == current_seller    
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)    
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def admin?(seller)
    current_seller.admin == seller
  end
  private

    def seller_from_remember_token
      remember_token = cookies[:remember_token]
      Seller.find_by_remember_token(remember_token) unless remember_token.nil?      
    end
end
