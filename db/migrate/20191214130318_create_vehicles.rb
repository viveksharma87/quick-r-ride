class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :number
      t.string :modal
      t.string :seater
      t.string :image
      t.integer :avalable, default: 1
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
