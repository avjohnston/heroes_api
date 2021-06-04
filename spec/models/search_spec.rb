require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'instance methods' do 
    it '#search returns supers matching the search' do 
      search = Search.new(name: 'loki')
    end 
  end 
end