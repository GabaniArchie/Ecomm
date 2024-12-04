ActiveAdmin.register Product do
  permit_params :name, :description, :price, :category_id
  
  controller do
    def scoped_collection
      super.includes(:category) # Ensure category association is eager loaded to prevent N+1 queries
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    actions
  end

  filter :name
  filter :category

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :category
    end
    f.actions
  end
end

