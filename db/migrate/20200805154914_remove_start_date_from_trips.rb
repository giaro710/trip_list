class RemoveStartDateFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :start_date, :string
  end
end
