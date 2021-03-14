class ShopsController < ApplicationController
  before_action :set_shop, only: :show
  include SortingSchedulesConcern

  def index
    @shops = Shop.all
  end

  def show
    @schedules = Schedule.where(shop: @shop)
    @today = @schedules.select { |schedule| schedule.weekday == Time.now.wday }
    @sorted_schedules = sorted_schedules(@today[0])
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
