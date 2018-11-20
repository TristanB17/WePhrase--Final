require 'rails_helper'

describe 'a User' do
  context 'translating a phrase' do
    it 'can submit a translation and view existing translations for that phrase' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)
      search_word = 'lightning'

      visit '/languages/1'
      expect(page).to have_content("Recent Translations for #{lang_2.name}")
      click_button "Get new phrases for #{lang_2.name}"

      within find('#phrase-search-form') do
        fill_in :phrase_search, with: search_word
        click_button "Search"
      end

      within first('.translate-card') do
        fill_in '.translate', with: 'Lightning is a meteorological phenomenon'
        binding.pry
      end
    end
  end
end
