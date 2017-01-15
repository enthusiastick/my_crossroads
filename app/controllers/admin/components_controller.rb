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

  def new
    @component = Component.new
  end

  protected

  def component_params
    params.require(:component).permit(:name, :code, :level, :category, :rarity, :primary, :secondary, :tertiary, :staff_notes)
  end
end
