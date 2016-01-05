class User < ActiveRecord::Base
	has_secure_password
	has_many :groups
	has_many :memberships
	has_many :member_of, through: :memberships, source: :groups

	# validations below
	validates :first_name, :last_name, presence: :true
	validates :password, presence: true
  	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :email, :presence => true, :uniqueness => { case_sensitive: false }, :format => { :with => email_regex }
end
