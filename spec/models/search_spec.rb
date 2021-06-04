require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'validations' do 
    it { should validate_uniqueness_of(:name).scoped_to(:race, :gender, :full_name, :publisher, :intelligence, :strength, :speed) }
  end

  describe 'instance methods' do 
    it '#search returns supers matching the search' do 
      search = Search.new(name: 'loki').search

      expect(search).to eq(Super.where('name ilike ?', "%loki%"))
      expect(search[0]).to be_a(Super)
      expect(search[0].name).to eq('Loki')
    end 
  end 
end