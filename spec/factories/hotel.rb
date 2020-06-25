FactoryBot.define do
  factory :hotel do
    sequence(:name)             { |n| "ホテル#{n}"}
    sequence(:address)          { |n| "大阪#{n}"}
    traffic_way                 {"車"}
    adult_price                 {2500}
    child_price                 { 0 }
    impression                  {"楽しかった"}
    parking                     {"あり"}
    official_site               {"https://myhyles.work/"}
  end
end
