require 'rails_helper'

RSpec.describe ShopsHelper, type: :helper do

  describe "format weekday method" do
    it "transforms an integer into a weekday" do
      expect(helper.format_weekday_fr(1)).to eq("Lundi")
      expect(helper.format_weekday_fr(2)).to eq("Mardi")
      expect(helper.format_weekday_fr(3)).to eq("Mercredi")
      expect(helper.format_weekday_fr(4)).to eq("Jeudi")
      expect(helper.format_weekday_fr(5)).to eq("Vendredi")
      expect(helper.format_weekday_fr(6)).to eq("Samedi")
      expect(helper.format_weekday_fr(0)).to eq("Dimanche")
    end
  end

  describe "format hour method" do
    it "transforms date/time into format hh:mm" do
      expect(helper.format_hour(DateTime.new(2020,3,20,11,55,47))).to eq("11:55")
    end
  end

  describe "format schedule method" do
    it "transforms two formatted time variables into a schedule (open / close)" do
      expect(helper.format_schedule((DateTime.new(2020,3,20,9,30,0)), (DateTime.new(2020,3,20,13,0,0)))).to eq("09:30 - 13:00")
    end
  end

  describe "closed? method" do
    it "returns true if shop is closed" do
      shop = Shop.new(name: "Anything")
      shop.save
      schedule = Schedule.new(weekday: 1)
      schedule.morning_opening_hour = nil
      schedule.morning_closing_hour = nil
      schedule.afternoon_opening_hour = nil
      schedule.afternoon_closing_hour = nil
      schedule.save
      expect(helper.closed?(schedule)).to eq(true)
    end
  end

  describe "open_non_stop? method" do
    it "returns true if a shop is open non stop all day" do
      shop = Shop.new(name: "Anything")
      shop.save
      schedule = Schedule.new(weekday: 1)
      schedule.morning_opening_hour = "09:00:00"
      schedule.morning_closing_hour = nil
      schedule.afternoon_opening_hour = nil
      schedule.afternoon_closing_hour = "16:30:00"
      schedule.save
      expect(helper.open_non_stop?(schedule)).to eq(true)
    end
  end
end
