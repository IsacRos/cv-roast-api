require 'rails_helper'

RSpec.describe AiResponseSerializer, type: :serializer do
  let!(:ai_response1) { build(:ai_response)}
  describe "#serialize" do
    it "correctly serializes an AI response object" do
      serialized = AiResponseSerializer.new(ai_response1).serializable_hash

      expected_result = {:data=>{
        :type=>:roast,
        :id=>nil,
        :relationships=>{:user=>{:data=>nil}},
        :attributes=>{
          :text=>ai_response1.text,
          :img_url=>ai_response1.img_url
        }
      }}

      expect(serialized).to eq(expected_result)
    end
  end  
end