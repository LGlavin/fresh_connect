class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :datetime
      t.string :address, null: false
      t.string :postal_code
      t.string :state
      t.string :city
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
