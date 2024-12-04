class SearchController < ApplicationController
  def index
    search_query = params[:search]
    category_id = params[:category]

    # Perform a simple search based on the search query
    products = Product.where('name LIKE ?', "%#{search_query}%")

    if category_id.present? && category_id != "all"
      # Filter the results based on the specified category ID
      category_id = category_id.to_i
      @products = products.where(category_id: category_id)
      send_flash_message(@products)
    else
      # If no category ID is specified or it's set to "all", return all search results
      @products = products
      send_flash_message(@products)
    end
  end

  private

  def send_flash_message(products)
    if products.present?
      flash.now[:notice] = "Search results found!"
    else
      flash.now[:alert] = "No search results found."
    end
  end
end
