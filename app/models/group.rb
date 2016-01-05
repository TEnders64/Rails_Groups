class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :members, through: :memberships, source: :user

  validates :title, :description, presence: true
end
