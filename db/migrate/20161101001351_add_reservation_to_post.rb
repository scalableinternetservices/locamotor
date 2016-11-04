class AddReservationToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :reservation, :integer
    add_column :posts, :auto_book, :string
  end
end
