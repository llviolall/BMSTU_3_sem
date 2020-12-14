class PalindromeResult < ApplicationRecord
  validates :num, presence: true, uniqueness: true
end
