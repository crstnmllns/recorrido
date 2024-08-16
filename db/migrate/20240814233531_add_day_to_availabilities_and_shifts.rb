class AddDayToAvailabilitiesAndShifts < ActiveRecord::Migration[7.2]
  def change
    add_column :availabilities, :day, :integer, null: false
    add_column :shifts, :day, :integer, null: false
  end
end
