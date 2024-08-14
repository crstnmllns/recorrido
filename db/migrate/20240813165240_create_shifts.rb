class CreateShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :shifts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.string :status, null: false, default: 'sin asignar'
      t.timestamps
    end
  end
end
