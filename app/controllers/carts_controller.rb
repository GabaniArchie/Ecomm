class CartsController < ApplicationController
    def show
      @products = Product.find(session[:cart])
    end
  
    def add_item
      session[:cart] ||= []
      product_id = params[:product_id].to_i
      session[:cart] << product_id unless session[:cart].include?(product_id)
    end
      
  
    def remove_item
      product_id = params[:product_id].to_i
      session[:cart].delete(product_id)
      redirect_back(fallback_location: root_path)
    end
  end
  