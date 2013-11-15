class AddUserIdToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :user_id, :integer
  end
end
