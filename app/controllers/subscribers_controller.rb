class SubscribersController < ApplicationController
  def index
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_lead] = true
      flash[:notice] = "Thank you for subscribing!"
      redirect_to root_path
    else
      flash[:alert] = "There was an error trying to subscribe"
      redirect_to root_path
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :source)
  end
end
