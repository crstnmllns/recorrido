class CreateServices < ActiveRecord::Migration[7.2]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description
      t.time :contract_start_time
      t.time :contract_end_time
      t.timestamps
    end
  end
end
