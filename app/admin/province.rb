# app/admin/province.rb

ActiveAdmin.register Province do
    permit_params :name, :gst, :pst, :hst
    
    index do
      selectable_column
      id_column
      column :name
      column :gst
      column :pst
      column :hst
      column :created_at
      column :updated_at
      actions
    end
  
    form do |f|
      f.inputs "Province Details" do
        f.input :name
        f.input :gst
        f.input :pst
        f.input :hst
      end
      f.actions
    end
  end
  