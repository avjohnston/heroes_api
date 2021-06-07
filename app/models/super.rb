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

  def self.sorting(param)
    valid_attr = ['name', 'publisher', 'intelligence', 'strength', 'speed']
    if valid_attr.include?(param.downcase)
      order(param.downcase + ' desc')
    else
      order(name: :asc)
    end
  end

  def self.search(params)
    supers = Super.all
    supers = supers.where('name ilike ?', "%#{params[:name]}%") if params[:name].present?
    supers = supers.where('race ilike ?', "%#{params[:race]}%") if params[:race].present?
    supers = supers.where('gender ilike ?', "#{params[:gender]}") if params[:gender].present?
    supers = supers.where('full_name ilike ?', "%#{params[:full_name]}%") if params[:full_name].present?
    supers = supers.where('publisher ilike ?', "%#{params[:publisher]}%") if params[:publisher].present?
    supers = supers.where('intelligence >= ?', params[:intelligence].to_i) if params[:intelligence].present?
    supers = supers.where('strength >= ?', params[:strength].to_i) if params[:strength].present?
    supers = supers.where('speed >= ?', params[:speed].to_i) if params[:speed].present?

    return supers
  end
end