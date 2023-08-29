FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '0z0z0z' }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { '太郎' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'タロウ' }
    birth_date            { '2000-10-10' }
  end
end
