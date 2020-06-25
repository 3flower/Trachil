FactoryBot.define do
  factory :travel do
    sequence(:title)             { |n| "テストタイトル#{n}"}
    travel_day                   {Date.parse("2020-6-24")}
    traffic_way                  {"車"}
    recommend_age                { 1 }
    evaluation                   {5.0}
    is_display                   {true}
  end
end
