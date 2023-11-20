require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:admin_user) { create(:user, :admin_role) }
  let(:moderator_user) { create(:user, :moderator_role) }

  before do
    def sign_in_user(user)
      session[:user_id] = user.id
    end
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(response).to be_successful }
  end

  describe 'GET #show' do
    before { get :show, params: { id: user.id } }

    it { expect(response).to be_successful }
  end

  describe 'GET #all_users' do
    before do
      sign_in_user(admin_user)
      get :all_users
    end

    it { expect(response).to be_successful }
  end

  describe 'GET #edit' do
    context 'when the user is signed in' do
      before do
        sign_in_user(user)
        get :edit, params: { id: user.id }
      end

      it { expect(response).to be_successful }
    end

    context 'when the user is not signed in' do
      before { get :edit, params: { id: user.id } }

      it { expect(response).to redirect_to(root_path) }
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before { post :create, params: { user: attributes_for(:user) } }

      it do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      before { post :create, params: { user: attributes_for(:user, email: nil) } }

      it do
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
      end

      it 'does not create a new User' do
        expect { subject }.not_to change(User, :count)
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) { { full_name: 'New Name' } }

    context 'when the user is signed in' do
      before do
        sign_in_user(user)
        put :update, params: { id: user.id, user: new_attributes }
      end

      it { expect(user.reload.full_name).to eq('New Name') }
      it { expect(response).to redirect_to(edit_user_path(user)) }
    end

    context 'when the user is not signed in' do
      before { put :update, params: { id: user.id, user: new_attributes } }

      it { expect(response).to redirect_to(root_path) }
    end
  end
end
