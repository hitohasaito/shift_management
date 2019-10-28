class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_user,only:[:destroy,:index]
  before_action :set_id, only:[:destroy, :edit, :update]
  before_action :allow_without_password, only: [:update]
  before_action :current_user_check,only:[:edit,:update]


  def index
    @users = User.all
  end

  def destroy
    if User.where(admin:true).count == 1
      redirect_to users_path, notice:"管理者は1名は必要です"
    else
      @user.destroy
      redirect_to users_path, notice:"削除しました"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice:"更新しました"
    end
  end

  def top
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :number, :password, :password_confirmation, :admin, :current_user)
  end

  def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
      end
  end

  def check_admin_user
    redirect_to shifts_path, notice: "権限がありません" unless current_user.admin?
  end

  def current_user_check
    @user = User.find(params[:id])
    redirect_to shifts_path, notice:"権限がありません" unless current_user.id == @user.id
  end

  def set_id
    @user = User.find(params[:id])
  end
end
