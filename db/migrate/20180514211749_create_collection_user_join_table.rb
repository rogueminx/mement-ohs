class CreateCollectionUserJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table(:collections, :users)
  end
end
