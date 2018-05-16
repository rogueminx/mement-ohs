class RenameJoinTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :collections_users, :memberships
  end
end
