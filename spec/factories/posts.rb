FactoryBot.define do
  factory :post do
    title { "MyString" }
    start_date { "2024-01-17 11:17:15" }
    end_date { "2024-01-17 11:17:15" }
    all_day { false }
    memo { "MyText" }
  end
end
