# frozen_string_literal: true

# Card Service
class CardCreateService < ApplicationService
  attr_reader :card

  DAYS = 3.days

  def initialize(current_user, card)
    @card = current_user.cards.build(card.merge(review_date: Time.current + DAYS))
  end

  def call
    @card
  end
end
