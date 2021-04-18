FactoryBot.define do
  factory :user do
    uid { Faker::Internet.uuid }
    token { Faker::Alphanumeric.alphanumeric(number: 60) }
  end
end
