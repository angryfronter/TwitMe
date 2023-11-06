# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update]
  before_action :set_user!, only: %i[edit update]
  before_action :authorize_user!
  after_action :verify_authorized

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def all_users
    @user = User.order(created_at: :desc)
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'You have successfully signed up!'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = 'Your profile information was successfully updated'
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :birthday, :address, :city, :state, :country, :zip, :password, :password_confirmation, :old_password)
  end

  def authorize_user!
    authorize(@user || User)
  end
end
