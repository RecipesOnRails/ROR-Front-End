FactoryBot.define do
  factory :user do
    uid { Faker::Internet.uuid }
    token { Faker::Alphanumeric.alphanumeric(number: 60) }
  end

  factory :omniauth_mock_user, parent: :user do
   uid {'100000000000000000000'}
   token {'MOCK_OMNIAUTH_KROGER_TOKEN'}
 end
end
