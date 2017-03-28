class Admin::UsersController < ApplicationController
  before_action :authenticate_staff!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(handle: params[:id])
  end
end
