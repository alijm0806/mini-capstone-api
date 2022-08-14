class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    # orders = Order.where(user_id: current_user.id)
    orders = current_user.orders
    render json: orders.as_json
  end

  def show
    @order = Order.find_by(id: params[:id])
    render template: "orders/show"
  end

  def create
    # hardcode create new order
    # add in user_id from current_user
    # calculate subtotal
    # find shopping cart
    # for each item in shopping cart
    # find the price and the quantity, multiply them
    # add that value to the subtotal
    # calculate tax
    # calculate total
    carted_products = current_user.carted_products.where(status: "carted")
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      product = Product.find_by(id: carted_product.product_id)
      calculated_subtotal += product.price * carted_product.quantity
    end

    p "calculated_subtotal"
    p calculated_subtotal

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_subtotal * 0.09,
      total: (calculated_subtotal * 0.09) + calculated_subtotal,
    )
    order.save

    carted_products.each do |carted_product|
      carted_product.order_id = order.id
      carted_product.status = "purchased"
      carted_product.save
    end
    render json: order.as_json

    # go back to shopping cart and update order id and status to purchased

  end
end
