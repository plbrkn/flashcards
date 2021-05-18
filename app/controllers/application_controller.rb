# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  def not_authenticated
    redirect_to login_path, alert: t('user.please_login')
  end
end
