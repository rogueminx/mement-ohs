class UpdateMementosTableRemoveRecipeient < ActiveRecord::Migration[5.2]
  def change
    rename_column :mementos, :recipient_id, :collection_id
    remove_column :mementos, :time_to_send
  end
end
