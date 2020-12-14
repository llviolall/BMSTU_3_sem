class User < ApplicationRecord
  validates_presence_of :name#, :password
  validates_uniqueness_of :name
  validates_length_of :name, :password, within: 5..20
  validates_format_of :name, with: /\A[\w+\-.]+\z/i

  has_secure_password
end
