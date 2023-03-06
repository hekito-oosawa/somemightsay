class Say < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 1023 }
  
  has_many :replies, class_name: "Say", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Say", optional: true
  
  validates :replies, presence: true, length: { maximum: 1023 }
end
