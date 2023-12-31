FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street_number { '0-0-1' }
    building { '渋谷キャンプ' }
    phone_number { '0700700700' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
