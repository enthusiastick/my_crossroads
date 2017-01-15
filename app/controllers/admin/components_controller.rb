class Admin::ComponentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @component = Component.new(component_params)
    if @component.save
      redirect_to admin_components_path
    else
      render :new
    end
  end

  def destroy
    @component = Component.find(params[:id])
    if @component.update(archived: true)
      redirect_to admin_components_path
    else
      render :edit
    end
  end

  def edit
    @component = Component.find(params[:id])
  end

  def index
    @components = Component.where(archived: false).order(:name)
  end

  def new
    @component = Component.new
  end

  def show
    @component = Component.find(params[:id])
  end

  def update
    @component = Component.find(params[:id])
    if @component.update(component_params)
      redirect_to admin_components_path
    else
      render :edit
    end
  end

  protected

  def component_params
    params.require(:component).permit(:name, :code, :level, :category, :rarity, :primary, :secondary, :tertiary, :staff_notes)
  end
end
