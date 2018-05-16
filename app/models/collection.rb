class Collection < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :mementos

  private
  def self.create_owner(collection)
    Membership.find_by(collection_id: collection.id).update_attribute(:owner, true)
  end
end
