require 'rails_helper'

RSpec.feature 'user logs in' do
  context 'using oauth2' do
    it 'is able to log in with correct credentials' do
      stub_omniauth

      greeting = 'Sign in with Google'
      first_name = 'Vincent'
      signout = 'Sign Out'

      visit root_path
      expect(page).to have_content(greeting)

      click_link(greeting)

      expect(page).to have_content(first_name)
      expect(page).to have_link(signout)
    end
  end
end
