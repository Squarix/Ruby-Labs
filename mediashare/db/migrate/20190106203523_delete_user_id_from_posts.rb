class DeleteUserIdFromPosts < ActiveRecord::Migration[5.2]
  def change
  	connection.execute("PRAGMA defer_foreign_keys = ON")
  	connection.execute("PRAGMA foreign_keys = OFF")
  	remove_column :posts, :users_id, :number
  	connection.execute("PRAGMA defer_foreign_keys = OFF")
  	connection.execute("PRAGMA foreign_keys = ON")
  end
end
