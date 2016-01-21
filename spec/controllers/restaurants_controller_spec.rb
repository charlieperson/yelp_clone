require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do

  it "" do
    get :index

    expect(response.status).to eq 200
  end
end
