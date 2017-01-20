class Admin::UserAdminStatusesController < ApplicationController
  before_action :authenticate_admin!

  def update
    @user = User.find_by(handle: params[:id])
    if @user.toggle(:admin) && @user.save
      redirect_to admin_user_path(@user)
    else
      render "admin/users/show"
    end
  end
end
