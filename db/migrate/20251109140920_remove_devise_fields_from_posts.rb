class RemoveDeviseFieldsFromPosts < ActiveRecord::Migration[8.0]
  def change
    remove_index  :posts, :email
    remove_column :posts, :email, :string
  end
end
