module ErrorHandling
  extend ActiveSupport::Concern

  included do
    # rescue_from StandardError do |exception|
    #   respond_to_error(exception)
    # end

    rescue_from ApiErrors::BadPromptInputError do |exception|
      render json: { error: exception, status: 400 }, status: :bad_request
    end
  end

  # def respond_to_error(exception)
  #   status_code = exception.respond_to?(:status_code) ? exception.status_code : 500
  #   render json: { error: exception.message }, status: status_code
  # end
end