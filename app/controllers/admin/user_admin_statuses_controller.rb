class Admin::UserAdminStatusesController < ApplicationController
  before_action :authenticate_admin!

  def update
    @user = User.find_by(handle: params[:id])
    if @user.toggle(:admin) && @user.save
      flash[:success] = "User admin privileges updated successfully."
      redirect_to admin_user_path(@user)
    else
      flash.now[:alert] = "There was a problem updating your user."
      render "admin/users/show"
    end
  end
end
