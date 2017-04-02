class CreateBookComunities < ActiveRecord::Migration[5.0]
  def change
    create_table :book_comunities do |t|
      t.integer :pupil_id
      t.text :about_me
      t.string :photo_from_last
      t.string :photo_form_today

      t.timestamps
    end
  end
end
