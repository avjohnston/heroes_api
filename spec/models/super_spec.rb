require 'rails_helper'

RSpec.describe Super, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:intelligence) }
    it { should validate_presence_of(:strength) }
    it { should validate_presence_of(:speed) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:race) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:first_appearance) }
    it { should validate_presence_of(:publisher) }
    it { should validate_presence_of(:image) }
  end 

  describe 'class methods' do 
    it '#pagination_helper' do 
      test1 = Super.pagination_helper
      test2 = Super.pagination_helper(2, 20)
      test3 = Super.pagination_helper(1, 50)
      test4 = Super.pagination_helper(100, 20)
      test5 = Super.pagination_helper(2)
      test6 = Super.pagination_helper(1, 600)
      test7 = Super.pagination_helper(1, -1)
      test8 = Super.pagination_helper(-1, 10)

      expect(test1.length).to eq(20)
      expect(test2.length).to eq(20)
      expect(test2.first).to eq(Super.all[20])
      expect(test3.length).to eq(50)
      expect(test4.length).to eq(0)
      expect(test5.length).to eq(20)
      expect(test6.length).to eq(348)
      expect(test7.length).to eq(20)
      expect(test7.first).to eq(Super.first)
      expect(test8.length).to eq(10)
      expect(test8.first).to eq(Super.first)
    end
    
    it '#custom_sort' do 
      supers = Super.all

      expect(Super.sorting('name')[0]).to eq(Super.all.last)
      expect(Super.sorting('speed')[0].speed).to eq(100)
      expect(Super.sorting('publisher')[0].publisher).to eq('Wildstorm')
      expect(Super.sorting('intelligence')[0].intelligence).to eq(100)
      expect(Super.sorting('speed')[0].speed).to eq(100)
      expect(Super.sorting('').size).to eq(Super.all.size)

      # expect(Super.sorting('alkjdsnu')[0].name).to eq(Super.first.name)
    end 

    it '#search returns supers matching the search' do 
      search = Super.search(name: 'loki')
      expect(search).to eq(Super.where('name ilike ?', "%loki%"))
      expect(search.all? {|sup| sup.name.downcase.include?('loki')}).to eq(true)

      search2 = Super.search(name: 'an', publisher: 'marvel', min_intelligence: 50, max_speed: 90)
      expect(search2.all? {|sup| sup.name.downcase.include?('an')})
      expect(search2.all? {|sup| sup.publisher.downcase.include?('marvel')})
      expect(search2.all? {|sup| sup.intelligence >= 50})
      expect(search2.all? {|sup| sup.speed <= 90})
    end 

    it '#search sad path' do
      search = Super.search(hello: 'world')
      expect(search.size).to eq(Super.all.size)

      search2 = Super.search(min_strength: 105)
      expect(search2).to eq([])

      search3 = Super.search(max_speed: -25)
      expect(search3).to eq([])

      search4 = Super.search(max_speed: 'hello')
      expect(search4).to eq([])

      search5 = Super.search(min_intelligence: 'hello')
      expect(search5.size).to eq(Super.all.size)
    end 
  end 
end