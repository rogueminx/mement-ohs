class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :collections, :users do |t|
      t.index :collection_id
      t.index :user_id
    end
  end
end
