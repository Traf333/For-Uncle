module SessionsHelper

  def sign_in(seller)
    cookies.permanent[:remember_token] = seller.remember_token
    current_seller = seller  
  end

  def signed_in?
    !current_seller.nil?    
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

  private

    def seller_from_remember_token
      remember_token = cookies[:remember_token]
      Seller.find_by_remember_token(remember_token) unless remember_token.nil?      
    end
end
