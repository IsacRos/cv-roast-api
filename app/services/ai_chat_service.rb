class AiChatService
  require 'openai'
  require 'api_errors'

  def initialize(prompt = DEFAULT_ROAST_PROMPT)
    @prompt = prompt 
    @ai_client = OpenAI::Client.new
  end

  def cv_roast(base64_file)
    response = @ai_client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [
          {
            "role": "user",
            "content": [
              {
                "type": "text",
                "text": @prompt,
              },
              {
                "type": "image_url",
                "image_url": {
                  "url":  "data:image/jpeg;base64,#{base64_file}"
                },
              },
            ],
          }
        ]
      }
    )
    content = validate_response(response)
    return content
  end


  def validate_response(ai_response = nil)
    content = ai_response.dig("choices", 0, "message", "content")
    if content.length < 20 && content.downcase.include?("false")
      raise ApiErrors::BadPromptInputError, "Oops.. doesn't really look like a CV, does it? Send something real!"
    elsif !content.is_a?(String)
      raise StandardError, "Something went wrong on my part, try again!"
    end

    return content
  end
end