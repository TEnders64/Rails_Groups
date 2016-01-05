class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :members, through: :memberships, source: :user

  validates :title, presence: true, length: {minimum: 6}
  validates :description, presence: true, length: {minimum: 11}
end
