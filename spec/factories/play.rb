FactoryBot.define do
  factory :play do
    sequence(:name)             { |n| "遊び#{n}"}
    sequence(:address)          { |n| "大阪#{n}"}
    traffic_way                 {"車"}
    adult_price                 {2500}
    child_price                 { 0 }
    impression                  {"楽しかった"}
    is_diaper_place             {true}
    parking                     {"あり"}
    official_site               {"https://myhyles.work/"}
  end
end
