class CreatePostalCodes < ActiveRecord::Migration
  def change
    create_table :postal_codes do |t|

      t.timestamps
    end
  end
end
