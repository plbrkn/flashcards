# frozen_string_literal: true

# Cards controller
class CardsController < ApplicationController
  before_action :init_card, only: %i[show edit update destroy]

  def index
    @cards = Card.all
  end

  def home
    @card = Card.random
  end

  def show; end

  def new
    @card = Card.new
  end

  def create
    @card = CardCreateService.call(card_params)

    if @card.save
      redirect_to @card
      flash.now[:notice] = t('cards.notice.create')
    else
      render :new
      flash.now[:warning] = t('cards.errors.fail')
    end
  end

  def edit; end

  def update
    if @card.update(card_params)
      redirect_to @card
      flash.now[:notice] = t('cards.notice.update')
    else
      render :edit
      flash.now[:warning] = t('cards.notice.fail')
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
    flash[:notice] = t('cards.notice.destroy')
  end

  private

  def init_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
