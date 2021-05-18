# frozen_string_literal: true

# User Sessions controller
class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(@user, notice: t('user.login_success'))
    else
      flash.now[:warning] = t('user.login_unsuccess')
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: t('user.logout'))
  end
end
