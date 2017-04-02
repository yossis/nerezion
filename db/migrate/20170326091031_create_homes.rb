class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.text :what_plan
      t.text :who_orgenize
      t.text :what_help
      t.text :what_need

      t.timestamps
    end
  end
end
