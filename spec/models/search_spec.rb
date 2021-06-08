require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'validations' do 
    it { should validate_uniqueness_of(:name).scoped_to(:full_name, :gender,  :min_intelligence, :max_intelligence, :min_speed, :max_speed,:min_strength, :max_strength, :publisher, :race)}
  end

  describe 'class methods' do 
    it 'should not save a search if it is not distinct' do 
      search = Search.create(name: 'loki', min_speed: 50)
      search2 = Search.create(name: 'loki', min_speed: 50)
      search3 = Search.create(name: 'loki')

      expect(search.save).to eq(true)
      expect(search2.save).to eq(false)
      expect(search3.save).to eq(true)
    end 
  end 
end