# frozen_string_literal: true

# Card
class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :original_text, length: { in: 1..128 }
  validates :translated_text, length: { in: 1..128 }, allow_blank: true
end
