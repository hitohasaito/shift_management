class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user,only:[:destroy,:index]
  before_action :set_id, only:[:destroy, :edit, :update]

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_path, notice:"更新しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :number, :password, :password_confirmation, :admin)
  end

  def check_user
    redirect_to shifts_path, notice: "権限がありません" unless current_user.admin?
  end

  def set_id
    @user = User.find(params[:id])
  end
end
