class RemoveEndNameFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :end_name, :string
  end
end
