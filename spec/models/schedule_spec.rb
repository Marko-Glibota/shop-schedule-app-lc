require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it "is not valid without attributes" do
    expect(Schedule.new).to_not be_valid
  end

  it "is not valid without valid attributes" do
    expect(Schedule.new).to_not be_valid
    shop = Shop.new(name: "Anything")
    schedule = Schedule.new(weekday: "one")
    schedule.shop = shop
    expect(schedule).to_not be_valid
  end

  it "is valid with an associated shop and a weekday attribute" do
    shop = Shop.new(name: "Anything")
    schedule = Schedule.new(weekday: 0)
    schedule.shop = shop
    expect(schedule).to be_valid
  end
end
