class AddEmailToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :sender_email, :string
    add_column :conversations, :recipient_email, :string
  end
end
