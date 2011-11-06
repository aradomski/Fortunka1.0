class AddUserIdToFortune < ActiveRecord::Migration
  def change
    add_column :fortunes, :user_id, :integer
  end
end
