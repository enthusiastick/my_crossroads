class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.pry
  end
end
