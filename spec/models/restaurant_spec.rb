require 'rails_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'is expected to have a name of over two letters' do
    restaurant = Restaurant.create(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is expected to have a unique name' do
    restaurant1 = Restaurant.create(name: "Chucks hot balls")
    expect(restaurant1).not_to have(1).error_on(:name)
    restaurant2 = Restaurant.create(name: "Chucks hot balls")
    expect(restaurant2).to have(1).error_on(:name)
    expect(restaurant2).not_to be_valid
  end

end
