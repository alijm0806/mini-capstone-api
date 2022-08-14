class CartedProductsController < ApplicationController
  def index

    # carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    @carted_products = current_user.carted_products.where(status: "carted")
    render template: "carted_products/index"
  end

  def create
    cp = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    cp.save
    render json: cp.as_json
  end

  def destroy
    product = CartedProduct.find_by(id: params[:id])
    product.status = "removed"
    product.save
    render json: { message: "product removed from cart" }
  end
end
