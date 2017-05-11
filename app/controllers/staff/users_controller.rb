class Staff::UsersController < ApplicationController
  before_action :authenticate_staff!

  def index
    @users = User.confirmed
  end

  def show
    @user = User.find_by(handle: params[:id])
  end
end
