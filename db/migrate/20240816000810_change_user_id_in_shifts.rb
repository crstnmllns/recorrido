class ChangeUserIdInShifts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :shifts, :user_id, true
  end
end
