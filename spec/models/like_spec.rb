require 'rails_helper'

RSpec.describe Like do
  describe '#validation' do
    context 'can save' do
      it "is valid with a user_id, post_id" do
        like = build(:like)
        expect(like).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a user_id" do
        like = build(:like, user_id: nil)
        like.valid?
        expect(like).to be_invalid
      end

      it "is invalid without a post_id" do
        like = build(:like, post_id: nil)
        like.valid?
        expect(like).to be_invalid
      end
    end
  end
end