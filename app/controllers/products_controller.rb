class ProductsController < ApplicationController
  before_action :set_product, except: [:index,:new, :create]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      reder :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render
    end
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:src])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
