class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  has_many :posts
  has_many :comments

  validates :email, :name, :role, presence: true

  # list of searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def admin?
    role.title == 'admin'
  end

  def editor?
    role.title == 'editor'
  end

  def writer?
    role.title == 'writer'
  end

  def readonly?
    role.title == 'readonly'
  end
end
