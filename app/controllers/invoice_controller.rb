class InvoiceController < ApplicationController
  def index
    @email = params[:email]
    @address = params[:address]
    cart_hash = {}

    total_price = 0
    session[:cart].each do |product_id, quantity|
      # Check if the product exists
      product = Product.find_by(id: product_id)

      if product.nil?
        # If the product doesn't exist, you can remove it from the cart and skip it
        flash[:alert] = "Product with ID #{product_id} not found. It may have been removed from inventory."
        next # Skip to the next product
      end

      price = product.sale ? product.price * 0.7 : product.price
      total_price += price * quantity
      cart_hash[product_id] = { quantity: quantity, price: price }
    end

    # Calculate taxes
    province = Province.find(Customer.find(current_customer.id).province_id)
    gst = province.gst.to_f || 0.0
    pst = province.pst.to_f || 0.0
    hst = province.hst.to_f || 0.0

    # Calculate total price including taxes
    total_with_taxes = total_price + gst + pst + hst

    # Create new order record
    order = Order.new(
      email: params[:email],
      address: params[:address],
      order_item: cart_hash,
      gst: gst,
      pst: pst,
      hst: hst,
      customer_id: current_customer.id,
    )

    # Save the order
    if order.save
      session[:cart].each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        if product
          items = OrderItem.new(
            order_id: order.id,
            product_id: product_id,
            Quantity: quantity,
          )
          items.save
        end
      end
      session.delete(:cart)
      redirect_to '/account'
    else
      # Handle errors
      flash[:alert] = "There was an issue with your order. Please try again."
      render :index
    end
  end
end
