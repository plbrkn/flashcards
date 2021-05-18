# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  let(:user) { create :user }

  describe 'GET #new' do
    it 'show new user form' do
      get :new
      assert_response :success
    end
  end

  describe 'POST #create' do
    it 'login user' do
      post :create,
           params: { email: user.email, password: 'MyString' }
      expect(logged_in?).to eq true
    end

    it 'cant login user' do
      post :create,
           params: { email: user.email, password: 'MyString1' }
      expect(logged_in?).to eq false
    end
  end

  describe 'DELETE #destroy' do
    it 'logout user' do
      login_user(user)
      delete :destroy, params: { id: user.id }
      expect(logged_in?).to eq false
    end
  end
end
