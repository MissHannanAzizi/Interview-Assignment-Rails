class CreateCarBatteries < ActiveRecord::Migration[8.0]
  def change
    create_table :car_batteries do |t|
      t.string :brand
      t.string :model
      t.integer :voltage
      t.integer :price
      t.integer :warranty

      t.timestamps
    end
  end
end
