class CreateRecipient < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.column :name, :string
      t.column :relation, :string
      t.column :email, :string
    end
  end
end
