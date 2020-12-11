require 'rails_helper'

RSpec.describe Post do
  describe '#validation' do
    context 'can save' do
      it "is valid with a content, user_id" do
        experience = build(:experience)
        expect(experience).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a date" do
        experience = build(:experience, date: nil)
        experience.valid?
        expect(experience.errors[:date]).to include("を入力してください")
      end

      it "is invalid without a explanation" do
        experience = build(:experience, explanation: nil)
        experience.valid?
        expect(experience.errors[:explanation]).to include("を入力してください")
      end
    end
  end
end

