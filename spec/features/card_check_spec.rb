# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardCheckController, type: :feature do
  let(:user) { create :user }
  let(:card) { create :card, user: user }

  before do
    card.update(review_date: Time.current - 3.days)
    visit root_path
    click_link I18n.t('user.login')
    fill_in :email,    with: user.email
    fill_in :password, with: 'MyString'
    click_button I18n.t('user.login')
  end

  it 'right' do
    visit root_path
    fill_in :translated_text, with: card.translated_text, visible: false
    click_button I18n.t('cards.send')
    expect(page).to have_content I18n.t('cards.right')
  end
end
