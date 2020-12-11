FactoryBot.define do
  factory  :experience do
    date          {Date.today}
    explanation  {"テスト体験記"}
    created_at    { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end 
