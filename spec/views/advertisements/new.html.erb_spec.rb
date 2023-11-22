require 'rails_helper'

RSpec.describe 'New Advertisement page' do
  include Authentication

  let(:tags) { create_list(:tag, 2) }

  context 'when user is authorized like admin' do
    let(:admin_user) { create(:user, :admin_role) }

    before do
      sign_in(admin_user)
      visit('/advertisements/new')
    end

    it 'renders the correct page title' do
      expect(page).to have_title('TwitMe')
    end

    it 'renders the correct heading' do
      expect(page).to have_css('h1', text: 'TwitMe')
    end
  end
end