ActiveAdmin.register Home do
  permit_params :heading, :moto, :message_one_heading, :message_one, :message_two_heading, :message_two

  index do
    selectable_column
    id_column
    column :heading
    column :moto
    # Add columns for other attributes as needed
    actions
  end

  filter :heading
  # Add filters for other attributes as needed

  form do |f|
    f.inputs "Home Details" do
      f.input :heading
      f.input :moto
      f.input :message_one_heading
      f.input :message_one
      f.input :message_two_heading
      f.input :message_two
      # Add inputs for other attributes as needed
    end
    f.actions
  end
end
