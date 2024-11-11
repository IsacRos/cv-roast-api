class AiResponseSerializer
  include JSONAPI::Serializer
  attributes :text, :img_url, :id

  set_type :roast

  belongs_to :user
end
