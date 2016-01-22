require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :restaurants }
  it { is_expected.to have_many :reviews }

  it {is_expected.to have_many :reviewed_restaurants}

  it 'does not allow a restaurant to be deleted by a user that did not create it' do
    user1 = User.create(email: 'charlie.person@hyperisland.se', password: '20012001')
    user2 = User.create(email: 'not.charlie@hyperisland.se', password: '20012001')
    restaurant = user1.restaurants.create(name: "Pizza Town")
    user2.destroy(restaurant)
    @current_user = current_user
    @current_user.restaurants.create(name: 'Pizza Town')
  end

end
