class Api::V1::SearchController < ApplicationController
  def create
    new_params = downcase_params(search_params)

    @supers = Search.create(search_params).search.pagination_helper(params[:page].to_i, params[:per_page].to_i)
    if params[:sort]
      @supers = @supers.sort(params[:sort])
    end
    @serial = SuperSerializer.new(@supers)

    render json: @supers, status: 201
  end

  private 

  def search_params
    params.permit(:name, :intelligence, :strength, :speed, :gender, :race, :full_name, :publisher)
  end

  def downcase_params(params)
    new_params = {}
    new_params[:name] = params[:name].downcase if params[:name]
    new_params[:gender] = params[:gender].downcase if params[:gender]
    new_params[:race] = params[:race].downcase if params[:race]
    new_params[:full_name] = params[:full_name].downcase if params[:full_name]
    new_params[:publisher] = params[:publisher].downcase if params[:publisher]

    return new_params
  end
end