class RemoveUserIdFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :user_id
  end
end
