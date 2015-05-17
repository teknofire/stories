class UsersController < ApplicationController
  before_action :fetch_user
  authorize_resource

  def index
    @users = User.all
  end

  def show

  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User has been updated' }
      else
        format.html { redirect_to @user, error: 'Unable to update user' }
      end
    end
  end

  def edit
  end

  protected

  def user_params
    if current_user.admin?
      params.require(:user).permit(:name, :admin, :authorized)
    else
      params.require(:user).permit(:name)
    end
  end

  def fetch_user
    @user = User.find(params[:id]) if params[:id].present?
  end

end
