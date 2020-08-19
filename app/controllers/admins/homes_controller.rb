class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def top
  end

  private

  def set_admin
    @admin = current_admin
  end
end
