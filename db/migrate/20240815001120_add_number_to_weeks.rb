class AddNumberToWeeks < ActiveRecord::Migration[7.2]
  def change
    add_column :weeks, :number, :integer
  end
end
