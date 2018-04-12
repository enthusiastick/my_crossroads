class Staff::EntitiesController < ApplicationController
  def index
    @entities = Entity.all
  end

  def show
    @entity = Entity.find_by(slug:params[:id])
  end

  
end
