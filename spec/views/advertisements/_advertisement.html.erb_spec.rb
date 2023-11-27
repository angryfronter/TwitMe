require 'rails_helper'

RSpec.describe 'Advertisement view', type: :view do
  include Authentication

  let(:user) { create(:user) }
  let(:admin_user) { create(:user, :admin_role) }
  let(:advertisement) { create(:advertisement, user: user) }

  before do
    sign_in(user)
    assign(:advertisement, advertisement)
    render partial: 'advertisements/advertisement', locals: { advertisement: advertisement }
  end

  it 'renders card body with title, image, tags, and body' do
    expect(rendered).to have_selector('div.card-body') do
      if advertisement.image.present?
        expect(rendered).to have_selector('div.border-top.py-3 img.img-fluid')
      else
        expect(rendered).not_to have_selector('div.border-top.py-3')
      end

      expect(rendered).to have_selector('section.card-text', text: truncate(strip_tags(advertisement.body), length: 160, separator: ' ', omission: '...'))
    end
  end

  it 'renders show link' do
    expect(rendered).to have_link('Show', href: advertisement_path(advertisement), class: 'btn btn-primary')
  end

  context 'when user is authorized' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      render partial: 'advertisements/advertisement', locals: { advertisement: advertisement }
    end

    it 'renders edit link' do
      expect(rendered).to have_link('Edit', href: edit_advertisement_path(advertisement), class: 'btn btn-secondary')
    end
  end

  it 'renders delete button' do
    if current_user && advertisement.destroyable_by?(current_user)
      expect(rendered).to have_selector("form[action='#{advertisement_path(advertisement)}'][method='post']") do
        expect(page).to have_button('Delete', class: 'btn btn-danger')
      end
    else
      expect(rendered).not_to have_selector("form[action='#{advertisement_path(advertisement)}'][method='post']")
    end
  end
end
