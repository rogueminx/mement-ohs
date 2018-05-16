class Membership <  ActiveRecord::Base
  belongs_to :user
  belongs_to :collection

  scope :find_membership_by_collection_id, -> (collection) { where(:collection_id => collection.id).first }
end
