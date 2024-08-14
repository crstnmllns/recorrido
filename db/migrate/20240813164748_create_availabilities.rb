class CreateAvailabilities < ActiveRecord::Migration[7.2]
  def change
    create_table :availabilities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.boolean :available, null: false, default: true
      t.timestamps
    end
  end
end
