class AddDayToShifts < ActiveRecord::Migration[7.2]
  def change
    add_column :shifts, :day, :string
  end
end
