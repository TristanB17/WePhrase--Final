require 'rails_helper'

RSpec.describe 'a user' do
  context 'when logged in' do
    it 'can select a new language (covered by wikipedia & yandex)' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)

      visit '/dashboard'
      expect(page).to have_button('Select New Language')
      click_button 'Select New Language'

      expect(current_path).to eq(new_language_path)
      expect(page).to have_content('Enter a Language Code')
      expect(page).to have_field(:language_abbreviation)
      expect(page).to have_content('see the guide below for a list of available languages')
    end
    it 'can select submit a new language' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)
      language_code = 'sw'

      visit '/languages/new'

      fill_in :language_abbreviation, with: language_code
      click_button 'Submit Language!'

      expect(current_path).to eq("/languages/#{Language.last.id}")
      expect(page).to have_content('No translations for this language yet!')
      expect(Language.all.count).to eq(3)
    end
    it 'can find new translations for submitted language' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)
      language_code = 'sw'
      search_word = 'Tanzania'

      visit '/languages/new'

      fill_in :language_abbreviation, with: language_code
      click_button 'Submit Language!'

      new_lang = Language.last

      visit "/languages/#{new_lang.id}/search/new"
      within find('#phrase-search-form') do
        fill_in :phrase_search, with: search_word
        click_button "Search"
      end

      expect(current_path).to eq("/languages/#{new_lang.id}/search")
    end
  end
end
