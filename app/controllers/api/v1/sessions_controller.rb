# frozen_string_literal: true

class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json
  
  private 

  def respond_with(resource, _opts = {})
    render json: {
      status: {
        code: 200, 
        message: 'Logged in successfully'
      }, 
      data: resource.as_json(except: [:jti])
    }
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

end
