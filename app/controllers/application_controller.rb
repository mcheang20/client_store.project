class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_filter :load_cart

  #def load_cart
  #  @cart = Cart.find(session[:cart_id]) if session[:cart_id].present?
  #end

  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      redirect_to root_path
    end
  end
end
