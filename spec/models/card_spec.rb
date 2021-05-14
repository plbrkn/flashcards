# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:user) { create :user }
  let(:card) { create :card, user: user }
  let(:invalid_card) { build :card, :invalid_card, user: user }
  let!(:random_card) { create :card, :random_card, user: user }

  it 'create valid card' do
    expect(card.save).to eq true
  end

  it 'create invalid card' do
    expect(invalid_card.save).to eq false
  end

  describe 'validations' do
    subject { card }

    it { should validate_presence_of(:original_text) }
    it { should validate_presence_of(:translated_text) }

    it {
      should validate_length_of(:original_text)
        .is_at_least(1).is_at_most(128)
    }
    it {
      should validate_length_of(:translated_text)
        .is_at_least(1).is_at_most(128)
    }
  end

  describe 'assotistions' do
    it { should belong_to(:user) }
  end

  describe 'random' do
    it 'get random card' do
      expect(Card.random).to eq random_card
    end
  end
end
