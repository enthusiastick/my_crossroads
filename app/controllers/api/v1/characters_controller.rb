class Api::V1::CharactersController < Api::ApiController
  def show
    character = Character.find_by(slug: params[:id])
    render json: character
  end
end
