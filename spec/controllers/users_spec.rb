# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  before do
    login_user(user)
  end

  describe 'GET #show' do
    it 'show user' do
      get :show, params: { id: user.id }
      assert_response :success
    end
  end

  describe 'GET #new' do
    it 'show new user form' do
      get :new
      assert_response :success
    end
  end

  describe 'POST #create' do
    it 'create valid user' do
      expect do
        post :create,
             params: { user: { email: 'asd', password: 'asdasdasd',
                               password_confirmation: 'asdasdasd' } }
      end.to change(User, :count).by(1)
    end

    it 'create invalid card' do
      expect do
        post :create,
             params: { user: { email: 'asd', password: 'asd', password_confirmation: 'asd' } }
      end.to_not change(User, :count)
    end
  end

  describe 'GET #edit' do
    it 'show edit user form' do
      get :edit, params: { id: user.id }
      assert_response :success
    end
  end

  describe 'PUT #update' do
    let(:update_user) do
      { email: 'asdasdasd', password: 'asdasdasdas', password_confirmation: 'asdasdasdas' }
    end
    let(:invalid_update_user) do
      { email: 'asdasdasd', password: 'asdasdasdas', password_confirmation: 'asdasdasd' }
    end

    it 'update user' do
      put :update, params: { id: user.id, user: update_user }
      user.reload
      expect(user.email).to eq update_user[:email]
    end

    it 'invalid user' do
      put :update, params: { id: user.id, user: invalid_update_user }
      user.reload
      expect(user).to eq user
    end
  end
end
