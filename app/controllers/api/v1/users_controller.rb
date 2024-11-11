class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def is_authenticated    
    render json: { message: 'Authenticated' }, status: :ok
  end
end
