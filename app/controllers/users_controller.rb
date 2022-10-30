class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      result(code: 200, result: @user)
    else
      result(state: :invalid_credentials)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
