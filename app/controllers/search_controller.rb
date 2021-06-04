class SearchController < ApplicationController
  def create
    new_params = search_params
    new_params[:name] = search_params[:name].downcase
    new_params[:gender] = search_params[:gender].downcase
    new_params[:race] = search_params[:race].downcase
    new_params[:full_name] = search_params[:full_name].downcase
    new_params[:publisher] = search_params[:publisher].downcase

    @search = Search.new(search_params).search
  end 

  private 

  def search_params
    params.permit(:name, :intelligence, :strength, :speed, :gender, :race, :height, :weight, :first_appearance, :full_name, :publisher, :image)
  end
end
