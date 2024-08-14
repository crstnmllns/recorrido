class CreateWeeks < ActiveRecord::Migration[7.2]
  def change
    create_table :weeks do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps
    end
  end
end
