class User < ApplicationRecord
  has_secure_password
  
  has_many :user_records
  has_many :records, through: :user_records
  has_many :artists, through: :records

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
