class Record < ApplicationRecord
  belongs_to :artist
  has_many :user_records
  has_many :users, through: :user_records
end
