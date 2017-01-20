class Admin::CharactersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @characters = Character.where(archived: false)
  end

  def show
    @character = Character.find_by(slug: params[:id])
    @markdown = new_markdown
  end
end
