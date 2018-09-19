require 'rails_helper'

RSpec.describe 'a user' do
  context 'navigating the site' do
    it 'can see all languages in the search bar' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      lang_1 = create(:language)
      lang_2 = create(:language_2)

      visit '/'

      
    end
  end
end
