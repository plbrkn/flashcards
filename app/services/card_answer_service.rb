# frozen_string_literal: true

# Card Answer Service
class CardAnswerService < ApplicationService
  attr_reader :card, :answer

  def initialize(card_id, answer)
    @card = Card.find(card_id)
    @answer = answer
  end

  def call
    @card.update(review_date: DateTime.now.next_day(3)) if @answer == @card.translated_text
  end
end
