require 'rails_helper'

RSpec.feature 'user logs in' do
  context 'using oauth2' do
    it 'is able to log in with correct credentials' do
      greeting = 'Sign in with Google'
      provider = 'google'
      first_name = 'Vincent'
      last_name = 'Price'
      uid = '12345678910'
      token = '12345'
      refresh_token = '123456'
      logout = 'Sign Out'

      stub_omniauth

      visit root_path
      expect(page).to have_content(greeting)

      click_link(greeting)

      expect(page).to have_content(first_name)
      expect(page).to have_content(logout)
    end
  end
end
