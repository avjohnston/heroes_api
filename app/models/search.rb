class Search < ApplicationRecord
  validates :name, uniqueness: {scope: [:race, :gender, :full_name, :publisher, :intelligence, :strength, :speed]}

  def search
    supers = Super.all

    supers = supers.where('name ilike ?', "%#{name}%") if name.present?
    supers = supers.where('race ilike ?', "%#{race}%") if race.present?
    supers = supers.where('gender ilike ?', "%#{gender}%") if gender.present?
    supers = supers.where('full_name ilike ?', "%#{full_name}%") if full_name.present?
    supers = supers.where('publisher ilike ?', "%#{publisher}%") if publisher.present?
    supers = supers.where('intelligence >= ?', intelligence) if intelligence.present?
    supers = supers.where('strength >= ?', strength) if strength.present?
    supers = supers.where('speed >= ?', speed) if speed.present?

    return supers
  end
end