FactoryBot.define do
  factory :user do
    name     { Faker::FamilyGuy.character }
    email    { Faker::Internet.email }
    password { '123cs12easc12'}


    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end    
  end
end
