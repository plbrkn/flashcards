# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardCheckController, type: :feature do
  let(:card) { create :card }
  before(:each) do
    card.update(review_date: Time.current - 3.days)
  end

  it 'right' do
    visit root_path
    fill_in :translated_text, with: card.translated_text, visible: false
    click_button I18n.t('cards.send')
    expect(page).to have_content I18n.t('cards.right')
  end

  it 'incorrectly' do
    visit root_path
    fill_in :translated_text, with: card.original_text, visible: false
    click_button I18n.t('cards.send')
    expect(page).to have_content I18n.t('cards.incorrectly')
  end
end
