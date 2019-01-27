class Person < ApplicationRecord
  has_one_attached :avatar

  validates :name, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, length: { minimum: 10 }
  validates :email, presence: true, length: { minimum: 10 }
  validates :avatar, presence: true
end
