# frozen_string_literal: true

# Cards controller
class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
end
