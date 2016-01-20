feature 'User features' do
  context 'Users that have signed up already' do
    before { User.create email: 'charlie.person@hyperisland.se', password: '2001CHUCKDOGG', password_confirmation: '2001CHUCKDOGG' }
    scenario 'allows users to sign_up' do
      visit '/'
      expect(page).to have_content('Sign in')
      click_link 'Sign in'
      fill_in 'Email', with: 'charlie.person@hyperisland.se'
      fill_in 'Password', with: '2001CHUCKDOGG'
      click_button 'Log in'
      expect(page).to have_content('restaurants')
    end
  end

  context 'Users that have not signed up yet' do
    scenario 'allows users to sign_up' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'charlie.person@hyperisland.se'
      fill_in 'Password', with: '2001CHUCKDOGG'
      fill_in 'Password confirmation', with: '2001CHUCKDOGG'
      click_button 'Sign up'
      expect(page).to have_content('Sign out')
    end
  end
end
