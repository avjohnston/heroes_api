class Api::V1::SuperController < ApplicationController
  def index
    @supers = Super.pagination_helper(params[:page].to_i, params[:per_page].to_i)
    @serial = SuperSerializer.new(@supers)

    render json: @serial
  end
end
