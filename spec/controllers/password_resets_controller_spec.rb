require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #create' do
    context 'with valid email' do
      before { post :create, params: { email: user.email } }

      it { expect(response).to redirect_to(new_session_path) }
      it { expect(flash[:success]).to eq('Instructions sent successfully to your E-Mail address') }
    end

    context 'with invalid email' do
      before { post :create, params: { email: 'invalid@example.com' } }

      it { expect(response).to redirect_to(new_session_path) }
      it { expect(flash[:success]).to eq('Instructions sent successfully to your E-Mail address') }
    end
  end

  describe 'GET #edit' do
    context 'with valid reset token' do
      before do
        user.set_password_reset_token
        get :edit, params: { email: user.email, password_reset_token: user.password_reset_token }
      end

      it { expect(response).to have_http_status(:found) }
    end

    context 'with invalid reset token' do
      before do
        user.set_password_reset_token
        get :edit, params: { email: user.email, password_reset_token: 'invalid_token' }
      end

      it { expect(response).to redirect_to(new_session_path) }
      it { expect(flash[:warning]).to eq('Failed password reset') }
    end
  end

  describe 'PATCH #update' do
    context 'with valid reset token and password' do
      before do
        user.set_password_reset_token
        patch :update, params: {
          user: {
            email: user.email,
            password_reset_token: user.password_reset_token,
            password: 'new_password',
            password_confirmation: 'new_password'
          }
        }
      end

      it { expect(response).to redirect_to(new_session_path) }
      it { expect(flash[:success]).to be_nil }
    end

    context 'with invalid reset token and password' do
      before do
        user.set_password_reset_token
        patch :update, params: {
          user: {
            email: user.email,
            password_reset_token: 'invalid_token',
            password: 'new_password',
            password_confirmation: 'new_password'
          }
        }
      end

      it { expect(response).to redirect_to(new_session_path) }
      it { expect(flash[:warning]).to eq('Failed password reset') }
    end

    context 'with invalid password confirmation' do
      before do
        user.set_password_reset_token
        patch :update, params: {
          user: {
            email: user.email,
            password_reset_token: user.password_reset_token,
            password: 'new_password',
            password_confirmation: 'wrong_password'
          }
        }
      end

      it 'redirects to the edit action' do
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
