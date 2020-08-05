class AddDatesToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :start_date, :string
    add_column :trips, :end_date, :string
  end
end
