require 'rails_helper'

RSpec.describe 'comments/show', type: :view do
  include Authentication

  let(:user) { create(:user) }
  let(:advertisement) { create(:advertisement) }
  let(:comment) { create(:comment, user: user, advertisement: advertisement) }

  before do
    assign(:comment, comment)
    assign(:advertisement, advertisement)
    render template: 'advertisements/show'
  end

  context 'when current user is not the author of the comment' do
    before do
      allow(comment).to receive(:editable_by?).and_return(false)
      allow(comment).to receive(:destroyable_by?).and_return(false)
      render template: 'advertisements/show'
    end

    it 'does not display edit link' do
      expect(rendered).not_to have_link('Edit comment', href: edit_advertisement_comment_path(advertisement, comment))
    end

    it 'does not display delete button' do
      expect(rendered).not_to have_button('Delete comment', type: 'submit', text: 'Delete comment')
    end
  end
end
