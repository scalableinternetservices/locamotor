class AddEmailToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :user_email, :string
  end
end
