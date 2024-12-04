FactoryBot.define do
  factory :ai_response do 
    img_url { Faker::Internet.url }
    text { Faker::Lorem.paragraph(sentence_count: 20)}
  end
end