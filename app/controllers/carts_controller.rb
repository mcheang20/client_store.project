class CartsController < ApplicationController

  def index
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    #your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = "sk_test_UvGqljRHkzGCHeTQgG4wZBq1"

    # Token is created using Stripe.js or Checkout!
    # Get the payment token submitted by the form:
    token = params[:stripeToken]

    # Charge the user's card:
    charge = Stripe::Charge.create(
     :amount => (@cart.total_price * 100).to_i,
     :currency => "usd",
     :description => "Charge order #{@cart.id}",
     :source => token,
    )

    @cart.update(status: "completed")
    flash[:notice] = "Thank you for your purchase"
    session.delete(:cart_id)
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:notice] = "Card declined"
    redirect_to @cart
  end
end
