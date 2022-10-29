class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ResponseHandler
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      result(code: 200, result: [@user])
    else
      result(state: :unauthorized)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
