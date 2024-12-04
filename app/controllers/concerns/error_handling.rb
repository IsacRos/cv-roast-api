module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ApiErrors::BadPromptInputError do |exception|
      render json: { error: exception, status: 400 }, status: :bad_request
    end
  end
end