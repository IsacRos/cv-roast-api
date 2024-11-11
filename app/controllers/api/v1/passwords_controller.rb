# frozen_string_literal: true

class Api::V1::PasswordsController < Devise::PasswordsController

  respond_to :json

  def create 
    resource = resource_class.send_reset_password_instructions(reset_params)
  
    if successfully_sent?(resource)
      render json: { message: "Password reset token sent"}, status: :ok
    else
      render json: { message: "Wrong"}, status: :unprocessable_entity
    end
  end

  private 

  def reset_params
    params.require(:user).permit(:email)
  end
end
