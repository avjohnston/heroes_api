class SuperController < ApplicationController
  def index
    @supers = Super.all
    @serial = SuperSerializer.new(@supers)

    render json: @serial
  end
end
