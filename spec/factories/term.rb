FactoryBot.define do
  factory  :term do
    term         {"テスト用語"}
    explanation  {"テスト用語の解説"}
    created_at   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end 
