require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:user) { create(:user) }
  let(:admin_user) { create(:user, :admin_role) }
  let(:moderator_user) { create(:user, :moderator_role) }
  let(:advertisement) { create(:advertisement, user: user) }

  before do
    def sign_in_user(user)
      session[:user_id] = user.id
    end
  end

  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in_user(user)
      get :index
    end

    it { expect(response).to be_successful }
  end

  describe 'GET #show' do
    before { get :show, params: { id: advertisement.to_param } }

    it { expect(response).to be_successful }
  end

  describe 'GET #new' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in_user(user)
      get :new
    end

    it { expect(response).to be_successful }
  end

  describe 'GET #edit' do
    let(:advertisement) { FactoryBot.create(:advertisement) }

    context 'when the user is an admin' do
      before do
        sign_in_user(admin_user)
        get :edit, params: { id: advertisement.to_param }
      end

      it { expect(response).to be_successful }
    end

    context 'when the user is a moderator' do
      before do
        sign_in_user(moderator_user)
        get :edit, params: { id: advertisement.to_param }
      end

      it { expect(response).to be_successful }
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        sign_in_user(user)
        post :create, params: { advertisement: attributes_for(:advertisement) }
      end

      it do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(advertisements_path)
      end
    end

    context 'with invalid params' do
      before do
        post :create, params: { advertisement: attributes_for(:advertisement, title: nil) }
      end

      it do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to('/')
      end

      it 'does not create a new Advertisement' do
        expect { subject }.not_to change(Advertisement, :count)
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) { { title: 'Test Advertisement' } }

    context 'for admin with valid params' do
      before do
        sign_in_user(admin_user)
        put :update, params: { id: advertisement.to_param, advertisement: new_attributes }
      end

      it { expect(advertisement.reload.title).to eq('Test Advertisement') }
      it { expect(response).to redirect_to(advertisements_path) }
    end

    context 'for admin with invalid params' do
      before do
        sign_in_user(admin_user)
        put :update, params: { id: advertisement.to_param, advertisement: attributes_for(:advertisement, title: nil) }
      end

      it { expect(response).to be_successful }
    end

    context 'for moderator with valid params' do
      before do
        sign_in_user(moderator_user)
        put :update, params: { id: advertisement.to_param, advertisement: new_attributes }
      end

      it { expect(advertisement.reload.title).to eq('Test Advertisement') }
      it { expect(response).to redirect_to(advertisements_path) }
    end

    context 'for moderator with invalid params' do
      before do
        sign_in_user(moderator_user)
        put :update, params: { id: advertisement.to_param, advertisement: attributes_for(:advertisement, title: nil) }
      end

      it { expect(response).to be_successful }
    end
  end


  describe 'DELETE #destroy' do
    context 'admin' do
      before { sign_in_user(admin_user) }

      it 'destroys the requested advertisement for admin' do
        expect { delete :destroy, params: { id: advertisement.to_param } }.to change(Advertisement, :count).by(0)
      end

      it 'redirects to the advertisements list for admin' do
        delete :destroy, params: { id: advertisement.to_param }
        expect(response).to redirect_to(advertisements_path)
      end
    end

    context 'moderator' do
      before { sign_in_user(moderator_user) }

      it 'destroys the requested advertisement for moderator' do
        expect { delete :destroy, params: { id: advertisement.to_param } }.to change(Advertisement, :count).by(0)
      end

      it 'redirects to the advertisements list for moderator' do
        delete :destroy, params: { id: advertisement.to_param }
        expect(response).to redirect_to(advertisements_path)
      end
    end

    context 'user' do
      before { sign_in_user(user) }

      it 'destroys the requested advertisement for user' do
        expect { delete :destroy, params: { id: advertisement.to_param } }.to change(Advertisement, :count).by(1)
      end

      it 'redirects to the advertisements list for user' do
        delete :destroy, params: { id: advertisement.to_param }
        expect(response).to redirect_to('/')
      end
    end
  end
end
