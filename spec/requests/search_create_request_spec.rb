require 'rails_helper'

RSpec.describe 'Api::V1::Search Create', type: :request do
  before :each do 
    @attr = %i[id name intelligence strength speed gender race height weight first_appearance full_name publisher image]
  end

  describe 'happy path' do 
    it 'should return a list of supers that match the search with valid params' do 
      valid_params = {
        name: 'an',
        strength: 50
      }
      post api_v1_search_index_path params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json.size).to eq(20)
      expect(json[0][:attributes].keys).to eq(@attr)
      expect(json[0][:id]).to be_an(String)
      expect(json[0][:type]).to eq('super')
      expect(json[0][:attributes][:name]).to eq('Absorbing Man')
      expect(json[0][:attributes][:intelligence]).to eq(38)
      expect(json[0][:attributes][:first_appearance]).to eq('Daredevil #1 (April, 1964) (As Rocky Davis)')
      expect(json[0][:attributes][:full_name]).to eq('Carl Creel')
      expect(json[0][:attributes][:publisher]).to eq('Marvel Comics')
      expect(json.all? {|hero| hero[:attributes][:strength] >= 50}).to eq(true)
      expect(json.all? {|hero| hero[:attributes][:name].downcase.include?('an')}).to eq(true)
    end

    it 'should return a list of supers that match the search with valid params 2' do
      valid_params = {
        race: 'human',
        gender: 'male',
        speed: 75
      }
      post api_v1_search_index_path params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json.size).to eq(16)
      expect(json[0][:attributes].keys).to eq(@attr)
      expect(json.all? {|hero| hero[:attributes][:race].downcase.include?('human')}).to eq(true)
      expect(json.all? {|hero| hero[:attributes][:gender].downcase == 'male'}).to eq(true)
      expect(json.all? {|hero| hero[:attributes][:speed] >= 75}).to eq(true)
    end

    it 'should return a list of supers that match the search with valid params 2' do
      valid_params = {
        full_name: 'an',
        publisher: 'marvel',
        intelligence: 60
      }
      post api_v1_search_index_path params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json.size).to eq(20)
      expect(json[0][:attributes].keys).to eq(@attr)
      expect(json.all? {|hero| hero[:attributes][:full_name].downcase.include?('an')}).to eq(true)
      expect(json.all? {|hero| hero[:attributes][:publisher].downcase.include?('marvel')}).to eq(true)
      expect(json.all? {|hero| hero[:attributes][:intelligence] >= 60}).to eq(true)
    end

    it 'should return a list of supers that match search with pagination' do 
      valid_params = {
        page: 2,
        per_page: 20
      }
      post api_v1_search_index_path params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json.size).to eq(20)
      expect(json[0][:attributes][:name]).to eq('Arachne')
      expect(json[0][:attributes].keys).to eq(@attr)
    end

    it 'should be able to sort as well as search' do
      valid_params = {
        name: 'z',
        strength: 25,
        sort: 'speed'
      }
      post api_v1_search_index_path params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json.size).to eq(8)
      expect(json[0][:attributes][:strength] > json[7][:attributes][:strength]).to eq(true)
      expect(json.all? {|hero| hero[:attributes][:name].downcase.include?('z')}).to eq(true)
      expect(json.all? {|hero| hero[:attributes][:strength] >= 25}).to eq(true)

      valid_params2 = {
        publisher: 'marvel',
        speed: 50,
        sort: 'name',
        page: 2, 
        per_page: 5
      }
      post api_v1_search_index_path params: valid_params2

      json2 = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json2.size).to eq(5)
      expect(json2[0][:attributes][:name]).to eq('Toad')
      expect(json2[1][:attributes][:name]).to eq('Thor Girl')
      expect(json2.all? {|hero| hero[:attributes][:publisher].downcase.include?('marvel')}).to eq(true)
      expect(json2.all? {|hero| hero[:attributes][:speed] >= 50}).to eq(true)
    end
  end 

  describe 'sad path' do 
    it 'should return empty array if no supers match' do 
      invalid_params = {
        speed: 101
      }
      post api_v1_search_index_path params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json).to eq([])

      invalid_params2 = {
        name: 'ajpsfbcouarq280'
      }
      post api_v1_search_index_path params: invalid_params2

      json2 = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json2).to eq([])
    end

    it 'should return all supers if params are invalid' do 
      invalid_params = {
        hello: 'world'
      }
      post api_v1_search_index_path params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json.size).to eq(20)
      expect(json[0][:attributes][:name]).to eq(Super.first.name)
    end

    it 'invalid sort param will default to name asc' do 
      invalid_params = {
        sort: 'full_name'
      }
      post api_v1_search_index_path params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)

      expect(json.size).to eq(20)
      # expect(json[0][:attributes][:name]).to eq(Super.first.name)
    end 

    it 'invalid page and per page wont break' do 
      #should default to page: 1, per_page: 20
      invalid_params = {
        page: -2,
        per_page: -20
      }
      post api_v1_search_index_path params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)
      expect(json.size).to eq(20)
      expect(json[0][:attributes][:name]).to eq(Super.first.name)
      expect(json[0][:attributes].keys).to eq(@attr)
      
      #should return empty array
      invalid_params2 = {
        page: 1000,
        per_page: 20
      }
      post api_v1_search_index_path params: invalid_params2

      json2 = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)
      expect(json2).to eq([])

      # should return all supers
      invalid_params3 = {
        page: 1,
        per_page: 800
      }
      post api_v1_search_index_path params: invalid_params3

      json3 = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(201)
      expect(json3.size).to eq(Super.all.size)
      expect(json3[0][:attributes][:name]).to eq(Super.first.name)
      expect(json3[0][:attributes].keys).to eq(@attr)
    end
  end 
end