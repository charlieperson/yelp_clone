require 'rails_helper'

feature 'reviews' do
  before do
    sign_up
    create_restaurant
  end

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'allows user to see average rating' do
    review_restaurant('KFC',3)
    click_link 'Sign out'
    sign_up(email: 'd@hotmail.com', password: 'longertest', password_confirmation: 'longertest')
    review_restaurant('KFC',5)
    expect(page).to have_content('Average rating: ★★★★☆')
  end

  scenario 'delete reviews when restaurant is deleted' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Delete KFC'

    expect(Review.first).not_to have_content('so so')
  end

end
