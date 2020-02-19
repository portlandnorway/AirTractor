class AddCoordinatesToTractors < ActiveRecord::Migration[5.2]
  def change
    add_column :tractors, :latitude, :float
    add_column :tractors, :longitude, :float
  end
end
