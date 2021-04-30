# frozen_string_literal: true

# Card
class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :original_text, :translated_text, length: { in: 1..128 }
end
