require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:user) { create(:user) }
  let(:advertisement) { create(:advertisement, user: user) }

  before do
    def sign_in(user)
      session[:user_id] = user.id
    end
  end

  describe 'GET #index' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: advertisement.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: advertisement.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Advertisement" do
        expect {
          post :create, params: { advertisement: attributes_for(:advertisement) }
        }.to change(Advertisement, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { advertisement: attributes_for(:advertisement, title: nil) }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: 'New title' }
      }

      it "updates the requested advertisement" do
        put :update, params: { id: advertisement.to_param, advertisement: new_attributes }
        advertisement.reload
        expect(advertisement.title).to eq('New title')
      end

      it "redirects to the advertisement" do
        put :update, params: { id: advertisement.to_param, advertisement: new_attributes }
        expect(response).to redirect_to(advertisement)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: advertisement.to_param, advertisement: attributes_for(:advertisement, title: nil) }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested advertisement" do
      expect {
        delete :destroy, params: { id: advertisement.to_param }
      }.to change(Advertisement, :count).by(-1)
    end

    it "redirects to the advertisements list" do
      delete :destroy, params: { id: advertisement.to_param }
      expect(response).to redirect_to(advertisements_url)
    end
  end
end