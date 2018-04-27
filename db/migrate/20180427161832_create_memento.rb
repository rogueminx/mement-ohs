class CreateMemento < ActiveRecord::Migration[5.2]
  def change
    create_table :mementos do |t|
      t.column :user_id, :integer
      t.column :recipient_id, :integer
      t.column :title, :string
      t.column :body, :string
      t.column :time_to_send, :date
    end
  end
end
