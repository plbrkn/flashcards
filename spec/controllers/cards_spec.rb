# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  describe 'GET #index' do
    it 'shows all cards' do
      get :index
      assert_response :success
    end
  end
end
