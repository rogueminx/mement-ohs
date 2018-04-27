class Memento < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient

  scope :current_user_mementos, -> (current_user_id) { where("user_id = #{current_user_id}")}
end
