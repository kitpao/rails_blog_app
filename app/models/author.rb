class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: 'should match confirmation', if: :password
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
end
