require 'rails_helper'

RSpec.describe Shop, type: :model do
  it "is not valid without valid attributes" do
    expect(Shop.new).to_not be_valid
  end

  it "is valid with a name attribute" do
    shop = Shop.new(name: "Anything")
    expect(shop).to be_valid
  end
end
