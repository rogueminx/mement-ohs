class DropInviteTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :invites
  end
end
