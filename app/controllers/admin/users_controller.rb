class Admin::UsersController < ApplicationController
  before_action :require_authentication
  before_action :set_user!, only: %i[edit update destroy]

  def index
    @user = User.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "You successfully changed information about user"
      redirect_to admin_user_path
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :password, :password_confirmation, :role
    ).merge(admin_edit: true)
  end
end