require 'rails_helper'

RSpec.describe 'advertisements/edit.html.erb', type: :view do
  include Authentication

  let(:user) { create(:user) }
  let(:advertisement) { create(:advertisement, user: user) }

  before do
    sign_in(user)
    assign(:tags, [])
    assign(:advertisement, advertisement)
    render template: 'advertisements/edit'
  end

  it 'displays the correct page title' do
    expect(view.content_for(:page_title)).to eq('Edit')
  end

  it 'displays the correct header' do
    expect(rendered).to have_selector('h1', text: 'Edit Advertisement')
  end

  it 'renders the form partial with tags' do
    expect(view).to render_template(partial: '_form', locals: { tags: [] })
  end
end
