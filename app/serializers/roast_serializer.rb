class RoastSerializer
  include JSONAPI::Serializer
  attributes :text, :img_url

  set_type :roast

  belongs_to :user
end
