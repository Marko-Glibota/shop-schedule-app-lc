require "rails_helper"

RSpec.describe '/shops', type: :request do

  describe "GET #index" do
    it "renders a successful response" do
      get root_path
      expect(response).to have_http_status("200")
    end
  end

  describe 'GET #show' do
    it 'renders a successful response' do
      shop = Shop.new(name: "Anything")
      shop.save
      weekdays = -1
      7.times do
        schedule = Schedule.new(
          weekday: weekdays + 1,
          morning_opening_hour: '9:00:00',
          morning_closing_hour: '12:00:00',
          afternoon_opening_hour: '13:00:00',
          afternoon_closing_hour: '18:00:00',
          shop: shop
        )
        weekdays += 1
        schedule.save
      end
      get shop_path(shop)
      expect(response).to have_http_status("200")
    end
  end
end
