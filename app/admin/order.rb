ActiveAdmin.register Order do
  permit_params :email, :gst, :pst, :hst, :address, :customer_id

  # Index page
  index do
    selectable_column
    id_column
    column :email
    column :gst
    column :pst
    column :hst
    column :address
    column :customer_id
    column :created_at
    column :updated_at
    column "Order Items Count" do |order|
      order.order_items.size
    end
    actions
  end

  # Filters
  filter :email
  filter :gst
  filter :pst
  filter :hst
  filter :address
  filter :customer_id
  filter :created_at
  filter :updated_at

  # Form for Orders
  form do |f|
    f.inputs "Order Details" do
      f.input :email
      f.input :gst
      f.input :pst
      f.input :hst
      f.input :address
      f.input :customer_id
    end
    f.actions
  end
end
