FactoryBot.define do
  factory :roast do 
    img_url { Faker::Internet.url }
    text { Faker::Lorem.paragraph(sentence_count: 20)}
  end
end