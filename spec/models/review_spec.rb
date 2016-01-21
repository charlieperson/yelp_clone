require 'rails_helper'

describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }
  it { is_expected.to belong_to :user }

  it "deletes reviews when a restaurant is deleted" do
    chucks = Restaurant.create(name: "Chuck's BBQ")
    chucks.reviews.create(thoughts: "A total shit hole!", rating: 5)
    chucks.destroy
    expect(Review.all).to eq([])
  end

  it "cannot be rated over 5" do
    review = Review.create(rating: 1000)
    expect(review).to have(1).error_on(:rating)
  end
end
