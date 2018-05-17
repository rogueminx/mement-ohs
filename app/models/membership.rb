class Membership <  ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  # attr_accessor :user_id, :collection_id
  # scope :find_membership_by_collection_id, -> (collection) { where(:collection_id => collection.id).first } // kept for reference add the .first to deal with relation
end
