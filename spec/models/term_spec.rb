require 'rails_helper'

RSpec.describe Term do
  describe '#validation' do
    context 'can save' do
      it "is valid with a term, explanation" do
        term = build(:term)
        expect(term).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a term" do
        term = build(:term, term: nil)
        term.valid?
        expect(term.errors[:term]).to include("を入力してください")
      end

      it "is invalid without a explanation" do
        term = build(:term, explanation: nil)
        term.valid?
        expect(term.errors[:explanation]).to include("を入力してください")
      end
    end
  end
end

