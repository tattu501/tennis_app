require 'rails_helper'

RSpec.describe User do

  describe '#validation' do
    context 'can save' do
      it "is valid with a name, email, password, password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is valid because the password is just 8 characters" do
        user = build(:user, password: "test1234", password_confirmation: "test1234")
        expect(user).to be_valid
      end

      it "is valid because the password is just 32 characters" do
        user = build(:user, password: "test1234" * 4 , password_confirmation: "test1234" * 4)
        expect(user).to be_valid
      end
    end
    context 'can not save' do
      it "is invalid without a name" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is invalid with a duplicate email" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      it "is invalid because it doesn't contain @ in the email" do
        user = build(:user, email: "test1234")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "is invalid because it doesn't contain . in the email" do
        user = build(:user, email: "test1234@test")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "is invalid because the email contains double-byte characters" do
        user = build(:user, email: "あtest1234@test.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password])
      end

      it "is invalid with a password that has less than 6 characters " do
        user = build(:user, password: "a1234")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it "is invalid without a password_confirmation" do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("を入力してください")
      end

      it "is invalid because it doesn't match password and password_confirmation" do
        user = build(:user, password_confirmation: "test1234")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end
end
