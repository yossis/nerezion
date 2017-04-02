class CreateNotInLists < ActiveRecord::Migration[5.0]
  def change
    create_table :not_in_lists do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :class_name
      t.boolean :is_teacher

      t.timestamps
    end
  end
end
