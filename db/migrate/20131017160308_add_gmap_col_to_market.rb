class AddGmapColToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :gmaps, :boolean
  end
end
