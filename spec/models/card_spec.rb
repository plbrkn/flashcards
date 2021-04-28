# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:card) { build(:card) }

  it 'create valid card' do
    expect(build(:card).save).to eq true
  end

  it 'create invalid card' do
    expect(build(:card, original_text: nil).save).to eq false
  end

  after(:all) { Card.destroy_all }
end
