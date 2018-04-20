require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#validations' do
    it 'is valid if required fields are present' do
      user = build(:event)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    [ #required field
      :name,
      :description
    ].each do |required_field|
      it "is invalid if #{required_field} is not present" do
        user = build(:event)
        user.send("#{required_field}=", '')
        expect(user).not_to be_valid
        expect(user.errors).to have_key(required_field)
      end

      it "is invalid if #{required_field} is set to nil" do
        user = build(:event)
        user.send("#{required_field}=", nil)
        expect(user).not_to be_valid
        expect(user.errors).to have_key(required_field)
      end
    end
  end
end
