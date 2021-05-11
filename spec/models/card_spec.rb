# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'create valid card' do
    expect(build(:card).save).to eq true
  end

  it 'create invalid card' do
    expect(build(:card, :invalid_card).save).to eq false
  end

  describe 'validations' do
    subject { build(:card) }

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

  describe 'random' do
    let!(:card) { create :card, :random_card }
    it 'get random card' do
      expect(Card.random).to eq card
    end
  end
end
