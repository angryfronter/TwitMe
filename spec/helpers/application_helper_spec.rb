require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#nav_tab' do
    it 'generates a link with the correct CSS class for the current page' do
      current_page = 'Home'
      title = 'Home'
      url = '/'
      options = { class: 'custom-class' }

      result = helper.nav_tab(title, url, current_page: current_page, options: options)

      expect(result).to include('text-secondary')
      expect(result).to include('custom-class')
    end

    it 'generates a link without additional CSS class for non-current pages' do
      current_page = 'Profile'
      title = 'Home'
      url = '/'
      options = { class: 'custom-class' }

      result = helper.nav_tab(title, url, current_page: current_page, options: options)

      expect(result).to include('text-white')
      expect(result).to include('custom-class')
    end
  end

  describe '#currently_at' do
    it 'renders the shared/menu partial with the correct locals' do
      current_page = 'Home'

      expect(helper).to receive(:render).with(partial: 'shared/menu', locals: { current_page: current_page })

      helper.currently_at(current_page)
    end
  end

  describe '#full_title' do
    it 'returns the base title if the page title is empty' do
      expect(helper.full_title('')).to eq('TwitMe')
    end

    it 'returns the full title with the page title if it is not empty' do
      page_title = 'About Us'
      expect(helper.full_title(page_title)).to eq("#{page_title} | TwitMe")
    end
  end
end
