class Collection < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :mementos
  has_many :invites
end
