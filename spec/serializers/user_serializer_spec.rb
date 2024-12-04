require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let!(:user1) {build(:user)}
  describe "#serialize" do
    it "Correctly serializes the user object" do
      serialized = UserSerializer.new(user1).serializable_hash
      
      expected_result =  {:data=> {
            :id=>user1.id.to_s,
            :type=>:user,
            :attributes=>{
              :email=>user1.email, :created_date=>user1.created_at.strftime('%d/%m/%Y')
            }
          }
        }

      expect(serialized).to eq(expected_result)
            
    end
  end
end