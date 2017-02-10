class OrdersController < ApplicationController
  def destroy
    @cart = Cart.find(params[:cart_id])
    @order = @cart.orders.find(params[:id])

      if @order.destroy
        flash[:notice] = "Item removed from your cart."
        redirect_to @cart
      else
        flash[:alert] = "There was a problem removing the item."
        redirect_to @cart
      end
  end
end
