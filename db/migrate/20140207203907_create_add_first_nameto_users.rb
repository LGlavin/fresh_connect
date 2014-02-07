class CreateAddFirstNametoUsers < ActiveRecord::Migration
  def change
    create_table :add_first_nameto_users do |t|

      t.timestamps
    end
  end
end
