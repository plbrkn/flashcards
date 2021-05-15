# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardAnswerService do
  let(:card) { create :card }

  it 'correctly answer' do
    expect(CardAnswerService.call(card.id, card.translated_text)).to be_truthy
  end

  it 'incorrectly answer' do
    expect(CardAnswerService.call(card.id, card.original_text)).to be_nil
  end
end
