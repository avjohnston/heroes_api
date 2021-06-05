require 'rails_helper'

RSpec.describe 'Api::V1::Super Index', type: :request do
  before :each do 
    @attr = %i[id name intelligence strength speed gender race height weight first_appearance full_name publisher image]
  end

  describe 'happy path' do
    it 'should return 200 with all supers' do
      get api_v1_super_index_path

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(200)

      expect(json.size).to eq(20)
      expect(json[0][:id]).to be_a(String)
      expect(json[0][:type]).to eq('super')
      expect(json[0][:attributes].keys).to eq(@attr)
    end

    it 'pagination should return correct page number and per page' do 
      get api_v1_super_index_path, params: {page: 2}

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(200)

      expect(json.size).to eq(20)
      expect(json[0][:id]).to be_a(String)
      expect(json[0][:type]).to eq('super')
      expect(json[0][:attributes].keys).to eq(@attr)
      expect(json[0][:attributes][:name]).to eq(Super.all[20].name)

      get api_v1_super_index_path, params: {per_page: 25}

      json2 = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(200)

      expect(json2.size).to eq(25)
      expect(json2[0][:id]).to be_a(String)
      expect(json2[0][:type]).to eq('super')
      expect(json2[0][:attributes].keys).to eq(@attr)
      expect(json2[0][:attributes][:name]).to eq(Super.all[0].name)

      get api_v1_super_index_path, params: {page: 5, per_page: 5}

      json3 = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(200)

      expect(json3.size).to eq(5)
      expect(json3[0][:id]).to be_a(String)
      expect(json3[0][:type]).to eq('super')
      expect(json3[0][:attributes].keys).to eq(@attr)
      expect(json3[0][:attributes][:name]).to eq(Super.all[20].name)
    end 
  end
  
  describe 'sad path' do 
    it 'should still return all super is given bad parameters' do 
      get api_v1_super_index_path, params: {hello: 'world'}

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to have_http_status(200)

      expect(json.size).to eq(20)
      expect(json[0][:id]).to be_a(String)
      expect(json[0][:type]).to eq('super')
      expect(json[0][:attributes].keys).to eq(@attr)
    end 
  end 
end