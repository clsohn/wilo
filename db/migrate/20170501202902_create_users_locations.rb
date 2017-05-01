class CreateUsersLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :users_locations do |t|
      t.belongs_to :user, null: false
      t.belongs_to :location, null: false
    end
  end
end
