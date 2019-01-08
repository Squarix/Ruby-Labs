class AddUserIdToPost < ActiveRecord::Migration[5.2]
  def change
  	connection.execute("PRAGMA defer_foreign_keys = ON")
  	connection.execute("PRAGMA foreign_keys = OFF")
  	remove_column :posts, :user_id, :number
  	connection.execute("PRAGMA defer_foreign_keys = OFF")
  	connection.execute("PRAGMA foreign_keys = ON")
  	add_column :posts, :user_id, :integer
  end
end
