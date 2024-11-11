module ApiErrors
  class BadPromptInputError < StandardError
    attr_reader :status_code
  
    def initialize(message = "Bad input file", status_code = :bad_request)
      super(message)
      @status_code = status_code
    end
  end  
end
