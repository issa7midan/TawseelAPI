class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end