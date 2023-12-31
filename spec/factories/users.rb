FactoryBot.define do
  factory :user do
    nickname              { 'suzuki' }
    email                 { Faker::Internet.email }
    password              { '0t0t0t' }
    password_confirmation { password }
    last_name             { '鈴木' }
    first_name            { '一郎' }
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'イチロー' }
    birth_date            { '2000-10-10' }
  end
end
