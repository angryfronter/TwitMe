require 'rails_helper'

RSpec.describe 'Form for Add advertisement' do
  let(:advertisement) { build(:advertisement) }
  let(:tags) { create_list(:tag, 2) }

  before do
    assign(:advertisement, advertisement)
    assign(:tags, tags)
    render 'advertisements/form', advertisement: advertisement, tags: tags
  end

  it 'renders the form elements' do
    expect(rendered).to have_field('advertisement_title')
    expect(rendered).to have_field('advertisement_body')
    expect(rendered).to have_field('advertisement_image')
    expect(rendered).to have_field('advertisement_tag_ids')
    expect(rendered).to have_button('Submit changes')
  end

  it 'renders the tags collection select' do
    expect(rendered).to have_select('advertisement_tag_ids', options: tags.map(&:title))
  end

  it 'renders the error partial' do
    expect(rendered).to render_template(partial: 'shared/errors', locals: { object: advertisement })
  end
end
