# frozen_string_literal: true

# Card Check controller
class CardCheckController < ApplicationController
  def create
    if CardAnswerService.call(params[:card_id], params[:translated_text])
      flash[:info] = t('cards.right')
    else
      flash[:warning] = t('cards.incorrectly')
    end
    redirect_back(fallback_location: card_check_index_path)
  end
end
