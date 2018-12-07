require 'rails_helper'

describe 'a User' do
  context 'translating a phrase' do
    it 'can submit a translation and view existing translations for that phrase', driver: :headless_chrome, js: true do
      Capybara.current_session.current_window.resize_to(1000, 1000)
      # VCR.use_cassette('user_search_mandarin_lightning', :record => :new_episodes) do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      search_word = 'lightning'
      yandex = 'Yandex Translator translates this as'
      first_text = '闪电，在大气科学中指大气中的强放电现象'
      first_translation = 'You submitted the first translation for this phrase! Congratulations!'

      visit '/languages/1'
      expect(page).to have_content("Recent Translations for #{lang_1.name}")
      click_button "Get new phrases for #{lang_1.name}"

      within find('#phrase-search-form') do
        fill_in :phrase_search, with: search_word
        click_button "Search"
      end

      expect(current_path).to eq("/languages/#{lang_1.id}/search")
      within first('.translate-card') do
        fill_in "user_translation", with: 'Lightning is a meteorological phenomenon'
        click_button 'Submit Translation'
      end

      page.driver.browser.navigate.refresh
      save_and_open_page

      within first('.translate-card') do
        click_button 'Submit Translation'
        expect(page).to have_text('Stop that you pleb.')
        # expect(page).to have_text(first_text)
        # expect(page).to have_text(yandex)
        # expect(page).to have_text(first_translation)
      end
    end
  end
end
