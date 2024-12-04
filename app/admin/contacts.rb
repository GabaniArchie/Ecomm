# app/admin/contacts.rb

ActiveAdmin.register Contact do
  permit_params :email, :phone

  index do
    selectable_column
    id_column
    column :email
    column :phone
    actions
  end

  form do |f|
    f.inputs "Contact Details" do
      f.input :email
      f.input :phone
    end
    f.actions
  end
end
