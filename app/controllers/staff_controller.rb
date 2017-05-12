class StaffController < ApplicationController
  def index
    @markdown = new_markdown
  end
end
