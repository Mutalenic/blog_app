class RenameRefToComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :users_id, :author_id
    rename_column :comments, :posts_id, :post_id
  end
end
