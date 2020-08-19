class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  
  def index
    @orders = Order.all.order(created_at: :asc)
    @orders = Order.page(params[:page]).per(2)
  end

  def show
  end

  private

  def set_admin
    @admin = current_admin
  end
end
