class CreatePupils < ActiveRecord::Migration[5.0]
  def change
    create_table :pupils do |t|
      t.string :first_name
      t.string :last_name
      t.string :madien_name
      t.string :class_name
      t.string :email
      t.string :phone
      t.boolean :is_coming, default: false
      t.boolean :is_registered, default: false
      t.boolean :is_teacher, default: false
      t.boolean :is_invited, default: false
      t.integer :invited_by
      t.string :invited_phone

      t.timestamps
    end
  end
end
