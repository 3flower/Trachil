FactoryBot.define do
  factory :meal do
    sequence(:shop_name)        { |n| "食事#{n}"}
    sequence(:address)          { |n| "大阪#{n}"}
    traffic_way                 {"車"}
    adult_price                 {2500}
    child_price                 { 0 }
    impression                  {"楽しかった"}
    is_baby_food_place          {true}
    parking                     {"あり"}
    official_site               {"https://myhyles.work/"}
  end
end
