class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.text :description
      t.datetime :datetime
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
