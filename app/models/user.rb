class User < ApplicationRecord
  has_secure_password
  validates :email,presence:true,uniqueness:true
  validates :name, presence: true,uniqueness:true,length: {minimum: 4}
  validates :password_digest,presence:true
  validates_confirmation_of :password
end