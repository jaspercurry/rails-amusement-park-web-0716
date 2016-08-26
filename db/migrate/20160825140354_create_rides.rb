class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :attraction, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :rides, :attractions
    add_foreign_key :rides, :users
  end
end
