class Staff::UserEditorStatusesController < ApplicationController
  before_action :authenticate_staff_editor!

  def update
    @user = User.find_by(handle: params[:id])
    if @user.toggle(:editor) && @user.save
      flash[:success] = "User editor privileges updated successfully."
      redirect_to staff_user_path(@user)
    else
      flash.now[:alert] = "There was a problem updating your user."
      render "staff/users/show"
    end
  end
end
