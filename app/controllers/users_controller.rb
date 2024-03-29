class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      redirect_to root_path 
    else
      redirect_to action: "show" 
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email,)
  end
end
