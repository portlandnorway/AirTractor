class CreateTractors < ActiveRecord::Migration[5.2]
  def change
    create_table :tractors do |t|
      t.string :name
      t.string :details
      t.integer :reward
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
