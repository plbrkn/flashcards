# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  before_action :init_user, only: %i[show edit update]

  skip_before_action :require_login, only: %i[index new create]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to @user, notice: t('user.created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('user.updated')
    else
      render :edit
    end
  end

  private

  def init_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
