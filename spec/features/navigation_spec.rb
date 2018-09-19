require 'rails_helper'

RSpec.describe 'a user' do
  context 'navigating the site' do
    it 'can see all languages in the search bar' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)

      visit '/'

      select(lang_1.name, from: :language)
      click_button 'Recent Translations'

      expect(current_path).to eq('/languages')
      expect(page).to have_content("Most Recent Translations for #{lang_1.name}")
    end
  end
end
