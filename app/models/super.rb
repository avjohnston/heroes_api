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
  
  def self.pagination_helper(page = 1, per_page = 20)
    page = 1 if page < 1
    per_page = 20 if per_page < 1

    offset = ((page - 1) * per_page)
    self.offset(offset).limit(per_page)
  end

  def self.search(param)
    order_by("#{param}")
  end
end