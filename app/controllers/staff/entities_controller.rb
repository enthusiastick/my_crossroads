class Staff::EntitiesController < ApplicationController
  before_action :authenticate_staff!
  
  def index
    @entities = Entity.all
  end

  def show
    @entity = Entity.find_by(slug:params[:id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    if @entity.save!
      redirect_to staff_entity_path(@entity)
    end
  end

  protected
  def entity_params
    params.require(:entity).permit(:name, :description)
  end

end
