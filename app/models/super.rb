class Super < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :intelligence, presence: true
  validates :strength, presence: true
  validates :speed, presence: true
  validates :gender, presence: true
  validates :race, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :full_name, presence: true
  validates :first_appearance, presence: true
  validates :publisher, presence: true
  validates :image, presence: true
end