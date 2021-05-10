# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardCreateService do
  let(:card) do
    CardCreateService.call(original_text: 'asd',
                           translated_text: 'asdd')
  end

  it 'correct review_date' do
    expect(card.review_date.round).to eq((Time.current + 3.days).round)
  end
end
