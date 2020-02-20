class AddColumnsToTractors < ActiveRecord::Migration[5.2]
  def change
    add_column :tractors, :bookings_count, :integer, null: false, default: 0
  end
end
