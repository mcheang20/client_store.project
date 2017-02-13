class PicsController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]

  before_action :authorize_user, only: [:destroy]

  def show
    @product = Product.find(params[:id])
    @pic = @product.pics.all
  end

 def create
   @product = Product.find(params[:product_id])
   @pic = @product.pics.new(pic_params)

   if @pic.save
     flash[:notice] = "Image saved successfully."
     redirect_to [@product]
   else
     flash[:alert] = "Image failed to save."
     redirect_to [@product]
   end
 end

 def destroy
  @product = Product.find(params[:product_id])
  @pic = @product.pics.find(params[:id])

  if @pic.destroy
    flash[:notice] = "Image was deleted successfully."
    redirect_to @product
  else
    flash[:alert] = "Image couldn't be deleted. Try again."
    redirect_to @product
  end
end

private

 def pic_params
   params.require(:pic).permit(:image)
 end

  def authorize_user
    pic = Pic.find(params[:id])
    unless current_user.admin?
      flash[:alert] = "You do not have permission to delete this image"
      redirect_to [pic.product]
    end
  end
end
