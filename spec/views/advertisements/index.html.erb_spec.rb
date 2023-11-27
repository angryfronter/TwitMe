require 'rails_helper'

RSpec.describe 'Index Advertisements page' do
  include Authentication

  let(:advertisements) {create_list(:advertisement, 2)}
  let(:tags) {create_list(:tag, 2)}

  context 'when user is authorized like admin' do
    let(:admin_user) { create(:user, :admin_role) }

    before do
      sign_in(admin_user)
      visit('/advertisements')
    end

    it 'renders the correct page title' do
      expect(page).to have_title('Advertisements')
    end

    it 'renders the correct heading' do
      expect(page).to have_css('h1', text: 'Advertisements')
    end

    it 'renders the search form with tags' do
      expect(page).to have_css('h2', text: 'Search by tags')
      expect(page).to have_selector('form[action="/advertisements"][method="get"]')
      expect(page).to have_button('Search')
    end

    it 'renders the list of tags for each advertisement' do
      advertisements.each do |advertisement|
        advertisement.tags.each do |tag|
          expect(page).to have_content(tag.title)
        end
      end
    end
  end
end
