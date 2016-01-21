require 'rails_helper'

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'charlie.person@hyperisland.se'
  fill_in 'Password', with: '2001CHUCKDOGG'
  fill_in 'Password confirmation', with: '2001CHUCKDOGG'
  click_button 'Sign up'
end
# Specs in this file have access to a helper object that includes
# the RestaurantsHelper. For example:
#
# describe RestaurantsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe RestaurantsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
