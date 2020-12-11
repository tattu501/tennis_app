require 'rails_helper'

RSpec.describe Experience do
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

      it "is invalid with a duplicate date" do
        experience = create(:experience)
        another_experience = build(:experience, date: experience.date)
        another_experience.valid?
        expect(another_experience.errors[:date]).to include("はすでに存在します")
      end
    end
  end
end

