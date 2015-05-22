class Admin::UsersController < ApplicationController
  before_action :authenticate_user_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, alert: t('admin.users.show.access_denied')
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to admin_users_path, notice: t('admin.users.update.success')
    else
      redirect_to admin_users_path, alert: t('admin.users.update.error')
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: t('admin.users.destroy.success')
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
