require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }

  before do
    def sign_in_user(user)
      session[:user_id] = user.id
    end
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(response).to be_successful }
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      before { post :create, params: { email: user.email, password: 'password' } }

      it { expect(response).to redirect_to(root_path) }
      it { expect(flash[:success]).to eq("Welcome back, #{user.full_name}!") }
    end

    context 'with invalid credentials' do
      before { post :create, params: { email: user.email, password: 'wrong_password' } }

      it { expect(response).to redirect_to(new_session_path) }
      it { expect(flash[:warning]).to eq('Invalid email/password') }
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in_user(user)
      delete :destroy
    end

    it { expect(response).to redirect_to(root_path) }
    it { expect(flash[:success]).to eq('You have been logged out') }
  end
end
