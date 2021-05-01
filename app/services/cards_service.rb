# frozen_string_literal: true

# Cards Service
class CardsService < ApplicationService
  attr_reader :card

  DAYS = 3.days

  def initialize(card)
    @card = card
  end

  def call
    @card.merge(review_date: Time.current + DAYS)
  end
end
