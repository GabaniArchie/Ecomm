class CreateHomes < ActiveRecord::Migration[7.1]
  def change
    create_table :homes do |t|
      t.string :heading
      t.text :moto
      t.string :message_one_heading
      t.text :message_one
      t.string :message_two_heading
      t.text :message_two

      t.timestamps
    end
  end
end
