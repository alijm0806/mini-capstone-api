class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json(methods: [:is_discounted?, :tax, :total])
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json(methods: [:is_discounted?, :tax, :total])
  end

  def create
    p params[:name]
    product = Product.new(name: params[:name], price: params[:price], description: params[:description], image_url1: params[:image_url1], image_url2: params[:image_url2], supplier_id: params[:supplier_id])
    if product.save
      render json: product.as_json
    else
      render json: product.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.image_url1 = params[:image_url1] || product.image_url1
    product.image_url2 = params[:image_url2] || product.image_url2
    product.supplier_id = params[:supplier_id] || product.supplier_id
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "you have removed the selected product" }
  end
end
