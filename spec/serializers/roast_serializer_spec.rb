require 'rails_helper'

RSpec.describe RoastSerializer, type: :serializer do
  let!(:roast1) { build(:roast)}
  describe "#serialize" do
    it "correctly serializes an AI response object" do
      serialized = RoastSerializer.new(roast1).serializable_hash

      expected_result = {:data=>{
        :type=>:roast,
        :id=>nil,
        :relationships=>{:user=>{:data=>nil}},
        :attributes=>{
          :text=>roast1.text,
          :img_url=>roast1.img_url
        }
      }}

      expect(serialized).to eq(expected_result)
    end
  end  
end