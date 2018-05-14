class Invite < ActiveRecord::Base
  belongs_to :collection
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
end
