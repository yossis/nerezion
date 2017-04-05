class CreateMemorials < ActiveRecord::Migration[5.0]
  def change
    create_table :memorials do |t|
      t.references :book, foreign_key: true
      t.integer :pupil_id_sender
      t.integer :pupil_id_reciver
      t.text :content

      t.timestamps
    end
    add_index :memorials, :pupil_id_sender
    add_index :memorials, :pupil_id_reciver
  end
end
