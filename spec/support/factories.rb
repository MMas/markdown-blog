FactoryGirl.define do

  factory :administrator do
    email Faker::Internet.email
    password "Abcdef12"
    password_confirmation "Abcdef12"
  end

  factory :subscriber do
  	email "test@test.com"
  end

  factory :article do
    name Faker::Lorem.sentence
    content Faker::Lorem.paragraph(2)
    association :administrator
  end

end
