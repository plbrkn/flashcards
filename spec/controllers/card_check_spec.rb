# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardCheckController, type: :controller do
  let(:user) { create :user }
  let(:card) { create :card, user: user }

  before do
    login_user(user)
  end

  describe 'POST #create' do
    it 'equal translated_text' do
      allow(CardAnswerService)
        .to receive(:call)
        .and_return(true)

      expect(CardAnswerService).to receive(:call)
      post :create, params: { card_id: card.id, translated_text: card.translated_text }
      expect(flash[:info]).to eq I18n.t('cards.right')
      expect(response).to redirect_to card_check_index_path
    end

    it 'unequal translated_text' do
      expect(CardAnswerService).to receive(:call)
      post :create, params: { card_id: card.id, translated_text: card.original_text }
      expect(flash[:warning]).to eq I18n.t('cards.incorrectly')
      expect(response).to redirect_to card_check_index_path
    end
  end
end
