FactoryBot.define do
  factory :user do
    sequence(:name)             { |n| "テスト名#{n}"}
    sequence(:email)            { |n| "test#{n}@test.com"}
    password                    {"123456"}
    password_confirmation       {'123456'}
    sequence(:residence)        { |n| "大阪府大阪市東淀川区#{n}"}
    is_child                    {true}
    child_people                { 1 }
    child_age                   { 1 }
    is_diaper                   {true}
    is_baby_food                {true}
    introduction                {"テスト"}
    is_valid                    {true}
  end
end
