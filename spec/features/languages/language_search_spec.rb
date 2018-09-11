require 'rails_helper'

describe 'a User' do
  context 'visiting a languages homepage' do
    it 'gets to a language search page' do
      user = create(:user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)

      visit '/languages/2'
      expect(page).to have_link('get some phrases')
      click_link 'get some phrases'

      expect(current_path).to eq("/languages/#{lang_2.id}/new")
      expect(page).to have_content("Search for phrases in an area of interest:")
      expect(page).to have_field(:phrase_search)
      expect(page).to have_button("Search")
    end
  end
  context 'visiting a language search page' do
    it 'enters a search word and sees phrases generated in that language for that word' do
      user = create(:user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      search_word = 'Spider-Man'

      visit "/languages/#{lang_2.id}/new"
      within find('#phrase-search-form') do
        fill_in :phrase_search, with: search_word
        click_button "Search"
      end

      expect(current_path).to eq("/languages/#{lang_2.id}/search")
      expect(page).to have_content('Die Spinne')
    end
    it 'translates a word if no matching page found in english' do
      user = create(:user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      search_word = 'spiderman'

      visit "/languages/#{lang_2.id}/new"
      within find('#phrase-search-form') do
        fill_in :phrase_search, with: search_word
        click_button "Search"
      end

      expect(current_path).to eq("/languages/#{lang_2.id}/search")
      expect(page).to have_content("Sorry, couldn't find anything for that query, maybe try formatting it differently (capitalized, hyphenated, etc)?")
    end
    it 'translates a mandarin phrase on heroku via encoding' do
      user = create(:user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      search_word = 'Big Bang'

      visit "/languages/#{lang_1.id}/new"
      within find('#phrase-search-form') do
        fill_in :phrase_search, with: search_word
        click_button "Search"
      end

      expect(current_path).to eq("/languages/#{lang_1.id}/search")
      expect(page).to have_content('大爆炸')
    end
  end
end
