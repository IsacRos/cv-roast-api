# frozen_string_literal: true

class Api::V1::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json

  def create()
    super
    if resource.persisted?
      UserMailer.with(user: resource).welcome_email.deliver_later
    end
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      
      render json: resource, status: :ok
    else render json: resource.errors, status: :unprocessable_entity
    end
  end


  def sign_up_params
    params.require(:registration).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
