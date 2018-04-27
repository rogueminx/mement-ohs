class AddAttachmentsToMementos < ActiveRecord::Migration[5.2]
  def change
    def up
      add_attachment :mementos, :image
    end

    def down
      remove_attachment :mementos, :image
    end
  end
end
