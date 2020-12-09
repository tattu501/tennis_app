FactoryBot.define do
  factory  :experience do
    date         {Fri, 06 Nov 2020}
    explaination {"これが表示される"}
    created_at   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end 
