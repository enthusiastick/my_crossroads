class Staff::ReceiptsController < ApplicationController
  before_action :authenticate_staff!

  def show
    @receipt = Receipt.find(params[:id])
  end
end
