require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:advertisement) { create(:advertisement, user: user) }
  let(:comment) { create(:comment, user: user, advertisement: advertisement) }

  before do
    def sign_in_user(user)
      session[:user_id] = user.id
    end
  end

  describe 'GET #edit' do
    before do
      sign_in_user(user)
      get :edit, params: { advertisement_id: advertisement.id, id: comment.id }
    end

    it { expect(response).to be_successful }
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        sign_in_user(user)
        post :create, params: { advertisement_id: advertisement.id, comment: attributes_for(:comment) }
      end

      it { expect(response).to redirect_to(advertisement_path(advertisement)) }
      it { expect(flash[:success]).to eq('Comment added!') }
    end

    context 'with invalid params' do
      before do
        sign_in_user(user)
        post :create, params: { advertisement_id: advertisement.id, comment: { body: nil } }
      end

      it { expect(response).to render_template('advertisements/show') }
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      before do
        sign_in_user(user)
        patch :update, params: { advertisement_id: advertisement.id, id: comment.id, comment: { body: 'Updated Body' } }
      end

      it { expect(response).to redirect_to(advertisement_path(advertisement, anchor: "comment_#{comment.id}")) }
      it { expect(flash[:success]).to eq('Comment has been updated!') }
    end

    context 'with invalid params' do
      before do
        sign_in_user(user)
        patch :update, params: { advertisement_id: advertisement.id, id: comment.id, comment: { body: nil } }
      end

      it { expect(response).to render_template(:edit) }
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in_user(user)
    end

    it 'destroys the requested comment' do
      expect {
        delete :destroy, params: { advertisement_id: advertisement.id, id: comment.id }
      }.to change(Comment, :count).by(1)
    end

    it 'redirects to root_path' do
      delete :destroy, params: { advertisement_id: advertisement.id, id: comment.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
