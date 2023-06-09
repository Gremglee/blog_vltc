class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :comments

  validates :content, :title, :author, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["author"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end
end
