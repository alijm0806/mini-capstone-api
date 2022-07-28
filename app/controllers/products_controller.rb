class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    p params["id"]
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    p params[:name]
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url],
    )
    product.save
    render json: product.as_json
  end

  def update
    p params[:name]
    product = product(
      product.name = params[:name],
      product.price = params[:price],
      product.description = params[:description],
      product.image_url = params[:image_url]
    )
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "product has been removed" }
  end
end
