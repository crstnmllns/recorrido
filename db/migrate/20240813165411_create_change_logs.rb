class CreateChangeLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :change_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shift, null: false, foreign_key: true
      t.text :change_description
      t.timestamps
    end
  end
end
