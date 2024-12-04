class UserController < ApplicationController
  before_action :authenticate_customer!
  def index
    @user = Customer.find(current_customer.id)
    @orders = Order.where(customer_id: current_customer.id)
  
    @order_items = {}
    @orders.each do |order|
      order_items = OrderItem.where(order_id: order.id)
      items_with_quantity = []
  
      order_items.each do |order_item|
        product = Product.find(order_item.product_id)
        items_with_quantity << { product: product, quantity: order_item.Quantity }
      end
  
      @order_items[order.id] = items_with_quantity
    end
  end
  
  
  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      # Update successful, handle accordingly (e.g., redirect to another page)
      redirect_to '/account', notice: 'Customer information updated successfully.'
    else
      # Update failed, render the edit page again with error messages
      render :edit
    end
  end

  def sign_out
    reset_session
    redirect_to '/', notice: 'Customer information updated successfully.'
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :address, :province_id, :avatar)
  end
end
