class RemoveDetailsFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :details, :string
  end
end
