class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  
    case params[:filter]
    when 'on_sale'
      @products = @products.where(sale: true)
    when 'new_items'
      # Assuming you have a column like 'created_at' to represent the creation date of products
      @products = @products.where('created_at >= ?', 3.days.ago).order(created_at: :desc)
    end
  
    # You might need to adjust this logic based on your actual implementation
  end
  

  def show
    @product = Product.find(params[:id])
  end

  def cart
    session[:cart] ||= []
    product_id = params[:product_id].to_i
    session[:cart] << product_id unless session[:cart].include?(product_id)
    @products = Product.find(session[:cart])
  end

  def cartRemove
    product_id = params[:product_id].to_i
    session[:cart].delete(product_id)
    redirect_back(fallback_location: root_path)
  end 
end
