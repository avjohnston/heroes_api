require 'rails_helper'

RSpec.describe SuperService, type: :model do
  describe 'class methods' do 
    it '#get_supers', :vcr do 
      response = SuperService.get_supers 

      expect(response.size).to eq(563)
      expect(response[0][:id]).to be_an(Integer)
      expect(response[0][:name]).to be_a(String)
      expect(response[0][:powerstats][:intelligence]).to be_an(Integer)
      expect(response[0][:powerstats][:strength]).to be_an(Integer)
      expect(response[0][:powerstats][:speed]).to be_an(Integer)
      expect(response[0][:appearance][:gender]).to be_a(String)
      expect(response[0][:appearance][:race]).to be_a(String)
      expect(response[0][:appearance][:height]).to be_an(Array)
      expect(response[0][:appearance][:weight]).to be_an(Array)
      expect(response[0][:biography][:fullName]).to be_a(String)
      expect(response[0][:biography][:firstAppearance]).to be_a(String)
      expect(response[0][:biography][:publisher]).to be_a(String)
      expect(response[0][:images][:md]).to be_a(String)
    end
  end 
end