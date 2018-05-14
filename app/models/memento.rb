class Memento < ActiveRecord::Base
  belongs_to :collection
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :current_user_mementos, -> (current_user_id) { where("user_id = #{current_user_id}")}
end
