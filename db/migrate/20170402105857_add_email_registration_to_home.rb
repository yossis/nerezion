class AddEmailRegistrationToHome < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :email_registration, :text
  end
end
