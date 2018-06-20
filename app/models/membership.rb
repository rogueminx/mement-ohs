class Membership <  ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  validates_uniqueness_of :collection_id, scope: :user_id
  # attr_accessor :user_id, :collection_id
  # scope :find_membership_by_collection_id, -> (collection) { where(:collection_id => collection.id).first } // kept for reference add the .first to deal with relation

  # scope :check_for_previous_membership, -> { |params| { where(:collection_id => params[0], user_id => params[1]).first}
end
