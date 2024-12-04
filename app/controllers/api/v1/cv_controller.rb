class Api::V1::CvController < ApplicationController
  before_action :authenticate_user!
  require 'openai'
  require 'tempfile'

  def roast
    user = current_user
    file = params[:cv]

    # Make temp image, then ai prompt. If response is ok, attach image and store response

    file_handler = FileHandlerService.new
    temp_image = file_handler.make_temp_image(file)

    base64_file = Base64.strict_encode64(temp_image.read)
    temp_image.rewind

    ai_chat = AiChatService.new
    content = ai_chat.cv_roast(base64_file)

    user.cv.attach(io: temp_image, filename: 'cv_image.jpg', content_type: 'image/jpeg')
    blob = user.cv.last.blob
    image_url = Rails.application.routes.url_helpers.rails_blob_url(blob, host: "http://localhost:3001")
    roast = AiResponse.create!(user: user, blob_id: blob.id, text: content, img_url: image_url)
  
  render json: {
    roast: roast
  }, status: :ok
  
  # render json: MOCK_ROAST_MESSAGE, status: :ok
  end

  def get_roast 
    id = params[:id]
    roast = AiResponse.find(id)
    serialized = AiResponseSerializer.new(roast).serializable_hash
    render json: serialized, status: :ok
  end

  def get_all_roasts
    responses = current_user.ai_responses
    serialized = AiResponseSerializer.new(responses).serializable_hash
    render json: serialized, status: :ok
  end
end
