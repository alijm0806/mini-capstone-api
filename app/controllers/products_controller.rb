class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    # take in params of category
    if params[:category]
      category = Category.find_by(name: params[:category])
      # find all the products in that category
      @products = category.products
    else
      @products = Product.all
    end
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params[:id])
    # render json: product.as_json(methods: [:is_discounted?, :tax, :total])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity],
      supplier_id: params[:supplier_id],
    )

    if @product.save
      render template: "products/show"
    else
      render json: @product.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.image_url = params[:image_url] || product.image_url
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "you have removed the selected product" }
  end
end
