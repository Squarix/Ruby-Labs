class ChangeUserIdTypeInUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :posts, :users
  	remove_foreign_key :users, :posts
  end
end
