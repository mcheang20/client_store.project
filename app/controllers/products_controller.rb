class ProductsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]

  def index
    @user = current_user
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product was added successfully."
      redirect_to @product
    else
      flash.now[:alert] = "Product failed to save"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      flash[:notice] = "Product was updated successfully."
      redirect_to @product
    else
      flash.now[:alert] = "There was an error updating the product."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      flash[:notice] = "\"#{@product.name}\" was deleted successfully."
      redirect_to products_path
    else
      flash.now[:alert] = "There was an error deleting the product."
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end
