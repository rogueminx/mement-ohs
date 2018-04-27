class AddAttachmentImageToMementos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :mementos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :mementos, :image
  end
end
