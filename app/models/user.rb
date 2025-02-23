class User < ApplicationRecord

  has_secure_password  # Automatically hashes password with bcrypt
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

end
