FactoryBot.define do
  factory  :term do
    term         {"テスト用語"}
    explaination {"これが表示される"}
    created_at   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end 
