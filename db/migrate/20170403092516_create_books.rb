class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :pupil, foreign_key: true
      t.string :last_name
      t.text :about
      t.boolean :expose_phone, default: false

      t.timestamps
    end
  end
end
