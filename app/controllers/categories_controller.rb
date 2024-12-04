class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def list
    @category = Category.find(params[:id])
    @products = @category.products
  end
end
