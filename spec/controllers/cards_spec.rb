# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:card) { create :card }

  describe 'GET #index' do
    it 'shows all cards' do
      get :index
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'show card' do
      get :show, params: { id: card.id }
      assert_response :success
    end
  end

  describe 'GET #new' do
    it 'show new card form' do
      get :new
      assert_response :success
    end
  end

  describe 'POST #create' do
    it 'create valid card' do
      expect do
        post :create,
             params: { card: { original_text: card.original_text,
                               translated_text: card.translated_text } }
      end.to change(Card, :count).by(2)
    end
  end

  describe 'GET #edit' do
    it 'show edit card form' do
      get :edit, params: { id: card.id }
      assert_response :success
    end
  end

  describe 'PUT #update' do
    let(:update_card) do
      { original_text: 'boo', translated_text: 'foo' }
    end

    it 'update card' do
      put :update, params: { id: card.id, card: update_card }
      card.reload
      expect(card.original_text).to eq update_card[:original_text]
      expect(card.translated_text).to eq update_card[:translated_text]
    end
  end

  describe 'DELETE #destroy' do
    it 'delete card' do
      expect do
        delete :destroy, params: { id: card.id }
        assert_response :redirect
      end.to change(Card, :count).by(0)
    end
  end
end
