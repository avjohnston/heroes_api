require 'rails_helper'

RSpec.describe SuperFacade, type: :model do
  describe 'class methods' do 
    it '#flood_db', :vcr do 
      SuperFacade.seed_db
      first = Super.first

      expect(first.id).to be_an(Integer)
      expect(first.name).to be_a(String)
      expect(first.intelligence).to be_an(Integer)
      expect(first.strength).to be_an(Integer)
      expect(first.speed).to be_an(Integer)
      expect(first.gender).to be_a(String)
      expect(first.race).to be_a(String)
      expect(first.height).to be_a(String)
      expect(first.weight).to be_a(String)
      expect(first.first_appearance).to be_a(String)
      expect(first.full_name).to be_a(String)
      expect(first.publisher).to be_a(String)
      expect(first.image).to be_a(String)
    end 
  end 
end