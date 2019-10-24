class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def check_user
    redirect_to shifts_path, nnotice: "権限がありません" unless current_user.admin?
  end
end
