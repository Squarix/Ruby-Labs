# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :img
      t.integer :cat
      t.text :description
      t.string :scope
      t.timestamps
    end
  end
end
