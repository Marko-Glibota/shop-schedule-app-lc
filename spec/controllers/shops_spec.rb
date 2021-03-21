require "rails_helper"

RSpec.describe '/shops', type: :request do

# Create a shop with 7 schedules

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

# Tests

  describe "GET #index" do
    it "renders a successful response" do
      get root_path
      expect(response).to have_http_status("200")
    end
  end

  describe 'GET #show' do
    it 'renders a successful response' do
      get shop_path(shop)
      expect(response).to have_http_status("200")
    end
  end

  describe 'Check for shop name on index' do
    it "displays shop name on shops index" do
      visit "/shops"
      expect(page).to have_text(shop.name)
    end
  end

  describe 'Check for weekdays on shop show' do
    it "displays every weekday on a shop show" do
      visit "/shops/#{shop.id}"
      expect(page).to have_text('Lundi' && 'Mardi' && 'Mercredi' && 'Jeudi' && 'Vendredi' && 'Samedi' && 'Dimanche')
    end
  end

  describe 'Check for shop name on shop show' do
    it "displays shop name on shop show" do
      visit "/shops/#{shop.id}"
      expect(page).to have_text(shop.name)
    end
  end
end
