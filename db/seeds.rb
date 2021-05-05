# frozen_string_literal: true

require './lib/seeds/cards'

cards = Seeds::Cards.new

cards.call
