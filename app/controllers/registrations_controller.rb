class RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.registration_confirmation(@user).deliver_now
      render json: @user.to_json
    else
      render json: @user.errors, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end
end
