require 'rails_helper'

describe 'a User' do
  context 'translating a phrase' do
    it 'can submit a translation and view existing translations for that phrase', driver: :headless_chrome do
      Capybara.current_session.current_window.resize_to(1000, 1000)
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      search_word = 'lightning'

      visit '/languages/1'
      expect(page).to have_content("Recent Translations for #{lang_1.name}")
      click_button "Get new phrases for #{lang_1.name}"

      within find('#phrase-search-form') do
        fill_in :phrase_search, with: search_word
        click_button "Search"
      end

      expect(current_path).to eq("/languages/#{lang_1.id}/search")
      within first('.translate-card') do
        fill_in '.translate', with: 'Lightning is a meteorological phenomenon'
        click_button 'Submit Translation'
      end


    end
  end
end
