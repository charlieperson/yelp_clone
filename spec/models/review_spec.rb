require 'rails_helper'

describe Review, :type => :model do
  it { should belong_to(:restaurant) }
  it { should belong_to(:user) }

  it 'is invalid if the rating is more than 5' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  it 'allows a review to be endorsed' do
    review = Review.create(rating: 1)
    review.endorsements.create()
    expect(review.endorsements.count).to eq 1
  end

end
