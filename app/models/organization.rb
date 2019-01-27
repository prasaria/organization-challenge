class Organization < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, length: { minimum: 10 }
  validates :email, presence: true, length: { minimum: 10 }
  validates :website, presence: true, length: { minimum: 10 }
  validates :logo, presence: true
end
