class CartController < ApplicationController
  before_action :authenticate_customer!

  def add_to_cart
    session[:cart] ||= {}
    product_id = params[:product_id]
    product = Product.find_by(id: product_id)  # Use `find_by` to safely check if the product exists

    if product.nil?
      redirect_to products_path, alert: "Product not found"  # Handle invalid product IDs
    else
      session[:cart][product_id] ||= 0
      session[:cart][product_id] += 1
      redirect_to view_cart_path, notice: 'Product added to cart successfully'
    end
  end

  def remove_from_cart
    product_id = params[:id]
    session[:cart].delete(product_id)
    redirect_to view_cart_path, notice: 'Product removed from cart successfully'
  end

  def update_cart
    product_id = params[:product_id]
    quantity = params[:quantity][product_id].to_i
    session[:cart][product_id] = quantity if session[:cart][product_id].present?
    redirect_to view_cart_path, notice: 'Cart updated successfully'
  end
end
