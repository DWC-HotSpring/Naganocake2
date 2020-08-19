class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  
  def index
  end

  def show
  end

  private

  def set_admin
    @admin = current_admin
  end
end
